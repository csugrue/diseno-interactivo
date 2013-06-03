/* @pjs preload="ninja.png"; */
/* @pjs preload="ninjastarsm.png"; */
/* @pjs preload="mount.png"; */

Ninja ninja;
ArrayList stars;

// images for game
PImage ninjaImage;
PImage fondo;
PImage star;

float lastTime = 0;
float nextTime = 50;

int power = 10;
float timer = 0;
boolean bPlaying = true;
int starRad = 30;

PFont font;


void setup() {

  size(600, 400);


  ninjaImage = loadImage("ninja.png");
  fondo = loadImage("mount.png");
  star = loadImage("ninjastarsm.png");

  ninja = new Ninja( ninjaImage.width, ninjaImage.height);
  stars = new ArrayList();

  font = createFont("Verdana", 16);
}

void draw() {
  // update time passed
  if (bPlaying) {
    timer++;
  }

  // background - draw black when gameover
  if (bPlaying){
    background(113, 210, 255); }
  else{
    background(0);
  }
  
  //update ninja and stars
  ninja.update();
  
  if (bPlaying) {
    updateStars();
  }

  // draw backdrop mountains
  imageMode(CORNER);
  image(fondo, width-fondo.width, height-fondo.height);

  // draw ninja
  ninja.display(ninjaImage);

  // draw stars
  if (bPlaying) {
    for (int i = 0; i < stars.size(); i++) {
      FallingObject myStar = (FallingObject)stars.get(i);
      myStar.display(star);
    }
  }

  // check if game over
  if ( power <= 0 ) {
    bPlaying = false;
    textFont(font);
    text("GAME OVER", width/2 - 50, height/2);
  }

  textFont(font);
  text("NINJA POWER  "+power, 20, 40);
  text("TIME  "+timer, width-140, 40);
}



void keyPressed() {

  if ( key == CODED) {
    if (keyCode == LEFT) {
      ninja.vel.x -= 1;
    } else if (keyCode == RIGHT) {
      ninja.vel.x += 1;
    } else if (keyCode == UP) {
      ninja.vel.y -= 1;
    } else if (keyCode == DOWN) {
      ninja.vel.y += 1;
    }
  }

  if ( key == 'r') {
    bPlaying = true;
    power = 10;
    timer = 0;
    stars.clear();
  }
}


void updateStars() {

  for (int i = 0; i < stars.size(); i++) {

    FallingObject myStar = (FallingObject)stars.get(i);

    myStar.update();

    if (myStar.pos.y > height+starRad) {
      stars.remove(i);
    } else if ( checkCollision( myStar.pos, ninja.pos, starRad+ninja.w*.5, i) ) {
      stars.remove(i);
      power--;
      background(252, 246, 42);
    }
  }

  // check time for adding new
  if ( millis()-lastTime > nextTime ) {
    nextTime = random(500, 1000);
    lastTime = millis();
    int num = int( random(2, 4) );

    for ( int i = 0; i < num; i++) {
      stars.add(new FallingObject());
    }
  }
}


boolean checkCollision(PVector A, PVector B, float limit, int index) {

  float d = dist(A.x, A.y, B.x, B.y);

  if ( d < limit) { 
    return true;
  } else { 
    return false;
  }
}

