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
    bullets.set(i,myBullet);
    
    myBullet.display( fireBall );
    
    float d = dist(pelota.x,pelota.y,myBullet.x,myBullet.y);
    if( d < (pelota.radius+1) ){
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

