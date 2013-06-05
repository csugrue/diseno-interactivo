Player tank;
Ball pelota;
ArrayList bullets;
PImage fireBall;


void setup(){
  
  size(400,400);
  
  // crear el objecto y llama su constructor
  tank = new Player();
  pelota = new Ball();
  
  bullets = new ArrayList();
  
  fireBall = loadImage("fireball.png");
}

void draw(){
  background(255);
  
  imageMode(CENTER);
  
  for( int i = 0; i < bullets.size(); i++){
    Bullet myBullet = (Bullet)bullets.get(i);
    myBullet.update();
    
    myBullet.display( fireBall );
    
    float d = dist(pelota.x,pelota.y,myBullet.x,myBullet.y);
    
    if( d < (pelota.radius+10) ){
      pelota.reset();
      bullets.remove(i);
    }else if( myBullet.x > width ){
      bullets.remove(i);
    }
  }
  
  pelota.update();
  
  pelota.display();
  tank.display();
  
  
}

void keyPressed(){

  if( keyCode == UP ){
    tank.move(-4);
  }else if( keyCode == DOWN ){
    tank.move(4);
  }
  
  
  if( key == ' '){
    if( bullets.size() < 5) {
      bullets.add( new Bullet(tank.x,tank.y) );
    }
  }
  
  
}

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



