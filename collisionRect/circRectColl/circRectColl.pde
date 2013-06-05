PVector circle;
PVector box;
float radius = 20;
float boxW = 100;
float boxH = 30;

void setup(){
  size(300,300);
  
  circle = new PVector(0,0);
  box = new PVector(width/2,height/2);
}

void draw(){
  
  background(255);
  
  fill(255);
  ellipse(circle.x,circle.y,radius*2,radius*2);
  
  
  boolean isColliding = circRectCollision( circle, radius, box, boxW, boxH );
  if( isColliding ){ 
    //println("COLLIDE");
    fill(255,0,0);
  }else { 
    fill(0);
    //println("NO"); 
  }
  
  rectMode(CENTER);
  rect(box.x,box.y, boxW,boxH);
  
//  circle.x = mouseX;
//  circle.y = mouseY;
  circle.set(mouseX,mouseY);
  
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

