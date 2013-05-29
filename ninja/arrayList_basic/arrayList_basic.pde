ArrayList balls = new ArrayList();

void setup(){
  size(300,300);
}

void draw(){
  
  background(255);
  
  for(int i = 0; i < balls.size(); i++){
    PVector b = (PVector)balls.get(i);
    b.y++;
    balls.set(i,b);
    
    ellipse(b.x,b.y,20,20);
    
    if( b.y > height+20) balls.remove(i);
    
    
  }
  
  println( balls.size() );
}

void mousePressed(){
  balls.add( new PVector(mouseX,mouseY) );
}


