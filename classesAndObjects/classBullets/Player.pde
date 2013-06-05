class Player{

  float x;
  float y;
  float ancho;
  float vx;
  float vy;
  float damp;
  
  // construtor
  Player(){
    x = 10;
    y = height/2;
    ancho = 20;
    vx = 0;
    vy = 0;
    damp = .95;
  }
  
  // functions
  void display(){
    
    x += vx;
    y += vy;
    vx *= damp;
    vy *= damp;
    
    rectMode(CENTER);
    rect(x,y,ancho,ancho);
    rectMode(CORNER);
  }
  
  void move( float cantidad ){
    //y += amount;
    vy += cantidad;
  }
  
  
}


