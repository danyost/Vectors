PImage doge;

PVector target;

PVector pos, vel, acc;

int time = 0;

void setup(){
  doge = loadImage("doge.png");
  
  size(640, 480);
  
  noStroke();
  
  background(0);
  
  pos = new PVector(width/2, height/2);
  vel = new PVector(0, 0);
  acc = new PVector(0, 0);
  
  textFont(createFont("comicbd.ttf", 16));
  
  colorMode(HSB, 100);
}

void draw(){  
  if(time == 0){
    vel.mult(0.75);
    
    acc = PVector.random2D();
    acc.mult(random(0.25));
    
    time = (int)random(1, 30);
    
    fill(random(100), 255, 255);
    
    switch((int)random(20)){
      case 0: text("much wow",          random(width), random(height)); break;
      case 1: text("many centipde",     random(width), random(height)); break;
      case 2: text("great amaze",       random(width), random(height)); break;
      case 3: text("many programming",  random(width), random(height)); break;
      case 4: text("such binary",       random(width), random(height)); break;
      case 5: text("many letter",       random(width), random(height)); break;
      case 6: text("lots of process",   random(width), random(height)); break;
      case 7: text("much random",       random(width), random(height)); break;
      case 8: text("so unpredictable",  random(width), random(height)); break;
      case 9: text("wowe",              random(width), random(height)); break;
    }
  }
  
  time--;
  
  vel.add(acc);
  pos.add(vel);
  
  translate(pos.x, pos.y);
  scale(0.25, 0.25);
  translate(-doge.width/2, -doge.height/2);
  
  image(doge, 0, 0);
  
  resetMatrix();
  
  if(pos.x > width)
    pos.x = 0;
  if(pos.y > height)
    pos.y = 0;
   if(pos.x < 0)
    pos.x = width;
  if(pos.y < 0)
    pos.y = height;
}