class Ninja {

  PVector pos;
  PVector vel;
  float damp;
  int w,h;
  
  Ninja(int imgW, int imgH) {
    pos = new PVector(200, 200);
    vel = new PVector(0, 0);
    damp = .99;
    w = imgW;
    h = imgH;
  }

  void update() {
    pos.add(vel);
    vel.mult(damp);
    updateBounds();
  }

  void updateBounds() {
    float halfW = w/2.0;
    float halfH = h/2.0;

    if ( pos.x < -halfW) {
      pos.x = width + halfW;
    } else if ( pos.x > width+halfW) {
      pos.x = -halfW;
    }

    if ( pos.y < -halfH) {
      pos.y = height+halfH;
    } else if ( pos.y > height+halfH) {
      pos.y = -halfH;
    }
  }
  
  
  void display( PImage img){
    imageMode(CENTER);
    image(img,pos.x,pos.y);
  }
  
}

