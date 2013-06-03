class Bullet{
  
  float x;
  float y;
  
  Bullet(float inX, float inY){
    x = inX;
    y = inY;
  }
  
  void display(){
    ellipse(x,y,2,2);
  }
  
  void display( PImage img ){
    image(img,x,y);
  }
  
  void update(){
    x += 4;
  }
  
}
