class Ball{

  float x;
  float y;
  float radius;
  
  Ball(){
    reset();
    radius = 20;
  }
  
  void reset(){
    x = random(width);
    y = -40;
  }
  
  void display(){
    ellipse(x,y,radius*2,radius*2);
  }
  
  void update(){
    
    // cambia y que esta sumando
    y += 5;
    
    // probar si estamos fuera de la ventana, y si hace un reset
    if( y > height){
      reset();
    }
  }
  
}


