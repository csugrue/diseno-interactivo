PVector pelota;
PVector vel;
float radius = 20;

PVector block;
float blockW = 100;
float blockH = 30;

int redVal = 0;

void setup(){
  size(300,300);
  pelota = new PVector(30,30);
  vel = new PVector(0,0);
  
  block = new PVector(width/2,height/2);

}

void draw(){
  
  background(255);
  
  fill(255);
  ellipse(pelota.x,pelota.y,radius*2,radius*2);
  
  fill(redVal,0,0);
  rectMode(CENTER);
  rect(block.x,block.y,blockW,blockH);
  
  
  pelota.add(vel);  // add velocity to make position change
  vel.mult(.99);    // decrease velocity to slow down over time (friction)
  
  // function to cehck collision with edges
  checkWallCollision(pelota,vel,radius);
  
  // check collision with rectangle and reverse velocity if hits
  boolean bCollide = circRectCollision(pelota,radius,block,blockW,blockH);
  if( bCollide ){
    vel.mult(-1.0);
    redVal = 255; // set bright red when collides   
  }
    
  // fade out red
  if(redVal > 0 ){
    redVal-=2;
  }
}

void mouseDragged(){
  pelota.set(mouseX,mouseY,0); // set postion to mouse position
  vel.set(0,0,0); // set velocity to 0 while moving with mouse
}

void mouseReleased(){
  vel.set( mouseX-pmouseX,mouseY-pmouseY);
}


// custom functions
void checkWallCollision(PVector myCirc, PVector myVel, float rad){
  if( myCirc.x > width-rad){
    myCirc.x = width-rad;
    myVel.x*=-1;
  }else if( myCirc.x < rad){
    myCirc.x = rad;
    myVel.x*=-1;
  }
  
  if( myCirc.y > height-rad){
    myCirc.y = height-rad;
    myVel.y*=-1;
  }else if( myCirc.y < 0+rad){
    myCirc.y = rad;
    myVel.y*=-1;
  }
}

boolean circRectCollision( PVector circle, float rad, PVector rectPos, float w, float h){
    
  float distX = abs(circle.x - rectPos.x);
  float distY = abs(circle.y - rectPos.y);
 
    if (distX > (w/2 + rad)) { return false; }
    if (distY > (h/2 + rad)) { return false; }
 
    if (distX <= (w/2)) { return true; }
    if (distY <= (h/2)) { return true; }
 
    float cornerDistance_sq = pow(distX - w/2, 2) +
                         pow(distY - h/2, 2);
 
    return (cornerDistance_sq <= pow(rad,2));
  
  
}




