String [] word = {
"simple","experience","everything","dark matter","forces","connect","create",
"subtle","close","hidden","light","freely"};
 
Particle [] pts;

String poem= "";
float lastTime = 0;
String lastWord = "";

void setup (){
    
  size( 400, 400 );
  pts = new Particle[ word.length ];
  
  for( int i = 0; i < pts.length; i++){
    pts[i] = new Particle();
    pts[i].myWord = word[i];
  }
      
}

void draw ()
{
    noStroke();
    fill(0,10);
    rect(0,0,width,height);
    
    stroke(255);
    
    boolean bAdded = false;
    for( int i = 0; i < pts.length; i++){
      
      pts[i].update();
      pts[i].render();
      
      for( int j = 0; j < i; j++){
        PVector diff = PVector.sub(pts[i].pos,pts[j].pos);
        float dist= diff.mag();
        if(dist < 10 ){
          
          if( millis()-lastTime > 500 || 
          (lastWord != pts[j].myWord && lastWord != pts[i].myWord ) ){
            
          poem += " " + pts[i].myWord+" " + pts[j].myWord;
          lastWord = pts[j].myWord;
          lastTime = millis();
          bAdded = true;
          }
          //pts[i].pickNewWord();
          //pts[j].pickNewWord();
          
          strokeWeight(2);
          stroke(255,0,0,255);
          point(pts[i].pos.x,pts[i].pos.y);
          point(pts[j].pos.x,pts[j].pos.y);
          
          noFill();
          stroke(255);
          ellipse(pts[i].pos.x,pts[i].pos.y,20,20);
          ellipse(pts[j].pos.x,pts[j].pos.y,20,20);
          
          
        }
      }
      
      
    }
    if(bAdded) poem+="<br/>";
    
    if(poem.length > 500) poem="";
    
    if(javascript != null){
      javascript.setText(poem);
  }   
  
}

JavaScript javascript;

interface JavaScript{
  void setText( String text );
}


void bindJS(JavaScript js){
 javascript = js;
}

class Particle{
  
  PVector pos;
  PVector vel;
  PVector targ;
  String myWord;
  
  Particle(){
    pos =new PVector(random(width),random(height));
    vel =new PVector(0,0);
    targ = new PVector(random(width),random(height));
    pickNewWord();
  }
  
  void pickNewWord(){
  int pickWord = int(random(0,word.length));
    myWord = word[ pickWord ];
  }
  
  void update(){
    pos.add(vel);
    
    PVector diff = PVector.sub(targ,pos);
    float dist = diff.mag();
    diff.normalize();
    diff.mult(.005);
    vel.add(diff);
    vel.mult(.99);
    
    if(dist < 5 ) targ.set(targ.x+random(-50,50),targ.y+random(-50,50));
    //targ.x = constrain(0,width);
    //targ.y = constrain(0,height);
    
    if(targ.x < 0 || targ.x > width) targ.x = random(width);
    if(targ.y < 0  || targ.y > height) targ.y = random(height);
  }
  
  void render(){
    stroke(255);
    strokeWeight(3);
    point(pos.x,pos.y);
    strokeWeight(1);
    //line(pos.x,pos.y,targ.x,targ.y);
  }
  
}


