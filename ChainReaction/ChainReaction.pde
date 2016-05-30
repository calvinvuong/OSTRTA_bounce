/*
Team OSTRTA -- Kathy Lau, Calvin Vuong, Ruochong Wu
APCS2 PD10
HW 47 -- All That Bouncin'
5/30/2016
*/
Ball[] balls;
int worldX = 700;
int worldY = 700;
boolean alreadyClicked; // can only click once

void setup(){
  size(700, 700);
  background(0); // black
  alreadyClicked = false;
  
  // generate ball objects
  balls = new Ball[50];
  for ( int i = 0; i < balls.length; i++ ) {
    balls[i] = new Ball( genXCoordinate(), genYCoordinate(),
                         genVelocity(), genVelocity(),
                         genColor() );
  }
  balls[0].setLife(true);
}


boolean collide(Ball b1, Ball b2) {
    double dist = Math.sqrt(Math.pow(b1.xcor - b2.xcor, 2) + Math.pow(b1.ycor - b2.ycor, 2));
    if (dist <= ((b1.diameter/2) + (b2.diameter/2)))
      return true;
    return false;
  }
  


void draw() {
  background(0); 
  for ( int i = 0; i < balls.length; i ++ ) {
       
  for (int j = 0; j < balls.length; j ++) {
    if ((balls[i].GROW || balls[i].SHRINK) && balls[j].BOUNCE) {
      if (collide(balls[i], balls[j])) {
        balls[j].GROW = true;
      }
    }
  }
   balls[i].draw(); 

 }
}

void mouseClicked() {
  if ( ! alreadyClicked ) {
    balls[0].xcor = mouseX;
    balls[0].ycor = mouseY;
    balls[0].vx= 0;
    balls[0].vy= 0;
    balls[0].setLife(false);  
    balls[0].GROW = true;
    alreadyClicked = true;
  }
}

// generates a random X coordinate within the contraints of the world
public int genXCoordinate() {
  return (int) (Math.random() * worldX);
}
// generates a random Y coordinate within the constraints of the world
public int genYCoordinate() {
  return (int) (Math.random() * worldY);
}

// generates random velocity
public int genVelocity() {
  int vel = (int) (Math.random() * 5) + 1;
  if ( Math.random() < 0.5 ) // 1/2 chance to give negative velocity
    vel = vel * -1;
  return vel;
}
  
// generates a random color in RGB form, stored as an array
public int[] genColor() {
  int[] rgb = new int[3];
  for ( int i = 0; i < rgb.length; i++ ) {
    rgb[i] = (int) (Math.random() * 256 );
  }
  return rgb;
}