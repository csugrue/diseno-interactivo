AudioPlayer player;

PVector circle;
PVector box;
float radius = 20;
float boxW = 50;
float boxH = 50;

void setup(){
  size(300,300);
  
  circle = new PVector(0,0);
  box = new PVector(width/2,height/2);
  
  // load audio file. if browser does not support mp3
  // it will try to load an ogg
  player = new AudioPlayer("dog.mp3");
  
  smooth();
}

void draw(){
  
  background(#9C00FF);
  
  // draw the circle
  fill(255);
  ellipse(circle.x,circle.y,radius*2,radius*2);
  
  // check if the circle and rect are colliding and
  // save result (true/false) in var
  boolean isColliding = circRectCollision( circle, radius, box, boxW, boxH );
  
  // if colliding play the sound and set fill to black 
  // otherwise pause sound and set color to white
  if( isColliding ){ 
    fill(0);
    player.play();
  }else { 
    fill(255);
    player.pause();
  }
  
  // draw box making sure rectMode is set to center
  rectMode(CENTER);
  rect(box.x,box.y, boxW,boxH);
  
  // set circle to mouse position
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

