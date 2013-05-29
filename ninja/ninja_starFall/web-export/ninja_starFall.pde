/* @pjs preload="ninja.png"; */
/* @pjs preload="ninjastarsm.png"; */
/* @pjs preload="mount.png"; */

// position and velocity of ninja
float x = 100;
float y = 100;
float vx = 0;
float vy = 0;
float damp = .99;

// images for game
PImage ninja;
PImage fondo;
PImage star;

// falling stars
ArrayList balls = new ArrayList();
float lastTime = 0;
float nextTime = 50;
int starRad = 30;

int power = 10;
int timer = 0;
boolean bPlaying = true;

PFont font;

void setup() {

  size(600, 400);

  ninja = loadImage("ninja.png");
  fondo = loadImage("mount.png");
  star = loadImage("ninjastarsm.png");

  font = createFont("Verdana", 16);
}

void draw() {

  // update time passed
  if(bPlaying) timer++;
  
  // background - draw black when gameover
  if(bPlaying) background(113, 210, 255);
  else background(0);

  //update position with velocity
  x += vx;
  y += vy;

  // update damping
  vx *= damp;
  vy *= damp;

  // wrpa around edges
  updateBounds();
  
  // update adding balls 
  updateBalls();
  
  // check collision with ninja and draw balls
  imageMode(CENTER);
  if (bPlaying) {
    
    for ( int i = 0; i < balls.size(); i++) {
      
      PVector b = (PVector)balls.get(i);
      checkCollision(b.x, b.y, starRad, i);

      pushMatrix();
        translate(b.x, b.y);
        rotate(millis()*.001);
        
        image(star, 0,0, starRad, starRad);
      popMatrix();
    }
  }
  
  // draw scene
  imageMode(CORNER);
  image(fondo, width-fondo.width, height-fondo.height);

  // draw ninja
  imageMode(CENTER);
  image(ninja, x, y);
  
  // check if game over
  if ( power <= 0 ) {
    bPlaying = false;
    textFont(font);
    text("GAME OVER", width/2 - 50, height/2);
  }

  textFont(font);
  text("NINJA POWER  "+power, 20, 40);

  //int time = int( millis()*.01);
  text("TIME  "+timer, width-140, 40);
}

void keyPressed() {

  if ( key == CODED) {
    if (keyCode == LEFT) {
      vx -= 1;
    } else if (keyCode == RIGHT) {
      vx += 1;
    } else if (keyCode == UP) {
      vy -= 1;
    } else if (keyCode == DOWN) {
      vy += 1;
    }
  }
  
  if( key == 'r'){
    bPlaying = true;
    power = 10;
    timer = 0;
    balls.clear();
  }
  
}

void updateBounds() {
  
  int halfW = ninja.width/2.0;
  int halfH = ninja.height/2.0;
  
  if ( x < -halfW) {
    x = width + halfW;
  } else if ( x > width+halfW) {
    x = -halfW;
  }

  if ( y < -halfH) {
    y = height+halfH;
  } else if ( y > height+halfH) {
    y = -halfH;
  }
}


void updateBalls() {

  if ( millis() - lastTime > nextTime) {
    nextTime = random(500, 1000);
    lastTime = millis();
    int num = int( random(2, 4) );

    for ( int i = 0; i < num; i++) {
      balls.add(new PVector(random(width), random(-30,-100) ));
    }
  }
  
  for ( int i = 0; i < balls.size(); i++) {
      PVector b = (PVector)balls.get(i);
      b.y += 2;
      balls.set(i, b);
  }
}

void checkCollision(float px, float py, float r, int index) {

  float d = dist(x, y, px, py);

  if ( d < (r+ninja.width*.5)) {
    balls.remove(index);
    power--;
    background(252, 246, 42);
  }
}


