PVector target;

PVector pos, vel, acc;

int time = 0;

void setup(){
  size(640, 480);
  
  noStroke();
  
  background(0);
  
  pos = new PVector(width/2, height/2);
  
  vel = new PVector(0, 0);
  
  randomSeed(1821743019);
}

void draw(){  
  if(time == 0){
    vel.mult(0.75);
    
    acc = PVector.random2D();
    acc.mult(random(0.25));
    
    time = (int)random(1, 10);
  }
  
  time--;
  
  vel.add(acc);
  pos.add(vel);
    
  fill(10, 0, 255);
  ellipse(pos.x, pos.y, 10, 10);
  
  if(pos.x > width)
    pos.x = 0;
  if(pos.y > height)
    pos.y = 0;
   if(pos.x < 0)
    pos.x = width;
  if(pos.y < 0)
    pos.y = height;
}