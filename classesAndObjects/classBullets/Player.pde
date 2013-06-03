class Player{

  float x;
  float y;
  float ancho;
  
  // construtor
  Player(){
    x = 10;
    y = height/2;
    ancho = 20;
  }
  
  // functions
  void display(){
    rectMode(CENTER);
    rect(x,y,ancho,ancho);
    rectMode(CORNER);
  }
  
  void move( float amount ){
    y += amount;
  }
  
  
}


