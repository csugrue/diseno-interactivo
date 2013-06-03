class FallingObject{

  PVector pos;
  
  FallingObject(){
    pos = new PVector( random(width), random(-40,-100) );
  }
  
  void update(){
    pos.y++;
  }
  
  void display(PImage img){
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(millis()*.001);
      image(img, 0, 0, starRad, starRad);      
    popMatrix();
  }
  
}

