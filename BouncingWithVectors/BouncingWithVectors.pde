float gravity_acceleration = 0.98;
float air_resistance = 0.99;

int bnum = 50;

int frame_rate = 60;

//declare a class which contains the ball variables
class Ball{
  PVector pos;
  PVector vel;

  float diam;
  float hue;
  
  Ball(){
    //initialize variables
    pos = new PVector(random(width), random(height));
    vel = PVector.random2D();
    vel.mult(5);
    
    diam = random(10, 90);
    hue = random(255);
  }
  
  void run(Ball[] balls){
    //bounce off of other balls
    for(Ball ball : balls){
      if(ball != this && dist(pos.x, pos.y, ball.pos.x, ball.pos.y) < diam/2 + ball.diam/2){
        pos.x += ((diam)) * ((pos.x - ball.pos.x)/dist(pos.x, pos.y, ball.pos.x, ball.pos.y) * 0.1);
        pos.y += ((diam)) * ((pos.y - ball.pos.y)/dist(pos.x, pos.y, ball.pos.x, ball.pos.y) * 0.1);
        vel.x *= -air_resistance;
        vel.y *= -air_resistance;
      }  
    }
    
    //bounce ball if it hits walls
    if (pos.x + diam/2 >= width) {
      vel.x = -abs(vel.x);    //if the ball hits the right wall, assign x velocity the negative version of itself
      pos.x = width - diam/2;    
    } else if (pos.x - diam/2 <= 0) {
      vel.x = abs(vel.x);     //if the ball hits the left wall, assign x velocity the positive version of itself
      pos.x = diam/2;
    }
    if (pos.y + diam/2 >= height) {
      vel.y = -abs(vel.y);
      pos.y = height - diam/2;
    } else if (pos.y - diam/2 <= 0) {
      vel.y = abs(vel.y);
      pos.y = diam/2;
    }
    
    //bounce off of the mouse cursor
    if(dist(pos.x, pos.y, mouseX, mouseY) < diam){
      vel.y = -10;
    }
          
    //simulate air resistance
    vel.x *= air_resistance;
    vel.y *= air_resistance;
    
    //simulate gravity
    vel.y += gravity_acceleration;  
      
    //add velocity to position
    pos.add(vel);
    
    //increment the hue
    hue++;
  }
  void bdraw(){
    //draw ball
    fill(hue % 255, 255, 255);
    ellipse(pos.x, pos.y, diam, diam);
  }
}

Ball[] balls = new Ball[bnum];

void setup() {
  
  frameRate(frame_rate);
  
  colorMode(HSB, 255);
  
  //set size of canvas
  size(800, 600);
  
  //initialize all of the balls
  for(int i = 0; i < bnum; i++){
    balls[i] = new Ball();
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);
  
  for(Ball ball: balls){
    ball.run(balls);
    ball.bdraw();
  }
}