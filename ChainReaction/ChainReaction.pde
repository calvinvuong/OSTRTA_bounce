Ball[] balls;
int worldX = 700;
int worldY = 700;

void setup(){
  size(700, 700);
  background(0); // black
  
  // generate ball objects
  balls = new Ball[2];
  for ( int i = 0; i < balls.length; i++ ) {
    balls[i] = new Ball( genXCoordinate(), genYCoordinate(),
                         genVelocity(), genVelocity(),
                         genColor() );
  }
  balls[0].setLife(true);
}



void draw() {
  background(0); 
  for ( int i = 0; i < balls.length; i ++ ) {
    balls[i].draw();
  }
}

void mouseClicked() {
  balls[0].xcor = mouseX;
  balls[0].ycor = mouseY;
  balls[0].vx= 0;
  balls[0].vy= 0;
   balls[0].setLife(false);  
   balls[0].GROW = true;
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