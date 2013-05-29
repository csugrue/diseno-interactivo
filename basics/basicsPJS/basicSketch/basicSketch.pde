float x,y,px,py;

void setup(){
  
  size(300,300);
  
  x = random(width);
  y = random(height);
  px = x + random( -10, 10 ); 
  py = y + random( -10, 10 );
  
  background(0);
}

void draw(){
  
  strokeWeight( 1 );
  stroke( random( 192 ) ); 
  line( x, y, px, py );
  
  px = x; 
  py = y; 
  x += random( -10, 10 ); 
  y += random( -10, 10 );
  
  if( x > width){ x = 0; }
  else if( x < 0 ){ x = width;}
  
  if( y > height){ y = 0; }
  else if( y < 0 ){ y = height; }
  
}
