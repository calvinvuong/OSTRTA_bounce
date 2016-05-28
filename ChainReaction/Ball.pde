public class Ball {
  // world size specifications, used for wall detection
  int worldX = 700;
  int worldY = 700;
  
  // positioining instance vars
  int diameter;
  int xcor;
  int ycor;
  int vx; // x-component of velocity
  int vy;
  
  // status instance vars
  boolean DEAD;
  boolean GROW;
  boolean SHRINK;
  boolean BOUNCE;
  int maxDiameter;
  
  // misc. instance vars
  int[] rgbColor;
  
  // default constructor
  public Ball() {
    // set default instance vars
    diameter = 10;
    xcor = 0;
    ycor = 0;
    vx = 0;
    vy = 0;
    rgbColor = new int[] {0,0,0};
    
    DEAD = false;
    GROW = false;
    SHRINK = false;
    BOUNCE = true;
    maxDiameter = 35;
  }
  
  // overloaded constructor
  public Ball(int x, int y, int velX, int velY, int[] hue) {
    this(); // use some default vals
    xcor = x;
    ycor = y;
    vx = velX;
    vy = velY;
    rgbColor = hue;
  }
  
  void draw() {
    fill(rgbColor[0], rgbColor[1], rgbColor[2]); // set colors
    ellipse(xcor+vx, ycor+vy, diameter, diameter);
    bounceWall();
    xcor += vx; // next cycle, move in x direction
    ycor += vy; // next cycle, move in y direction
  }
  
  // readjusts x and y velocity components if hits a wall
  // does nothing if ball does not hit wall
  private void bounceWall() {
    if ( xcor <= 0 || xcor >= worldX ) // hits vertical walls
      vx = vx * -1; // x component moves opposite direction
    
    if ( ycor <= 0 || ycor >= worldY ) // hits horizontal wall
      vy = vy * -1; // y component moves opposite direction
  }
      
}