/* @pjs preload="ninja.png"; */
/* @pjs preload="mount.png"; */

float x = 100;
float y = 100;
float vx = 0;
float vy = 0;
float damp = .99;
PImage ninja;
PImage fondo;

void setup() {

  size(600, 400);

  ninja = loadImage("ninja.png");
  fondo = loadImage("mount.png");
}

void draw() {


  //update position with velocity
  x += vx;
  y += vy;

  // update damping
  vx *= damp;
  vy *= damp;

  updateBounds();

  // background
  background(113, 210, 255);
  //rect(0,0,width,height);
  imageMode(CORNER);
  image(fondo, width-fondo.width, height-fondo.height);

  // draw ninja
  imageMode(CENTER);
  image(ninja, x, y);
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

