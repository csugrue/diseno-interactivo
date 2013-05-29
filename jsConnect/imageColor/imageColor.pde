PImage img;

void setup ()
{
    size( 300, 200 );
    img = loadImage("fruto.jpg");
}

void draw ()
{
    image( img,0,0 );
    
    img.loadPixels();
    mColor = img.get(mouseX,mouseY);
    if(javascript != null){
      javascript.setColor(red(mColor), green(mColor), blue(mColor));
    }   
}

// tell processing that javascript exists and has a setColor function
JavaScript javascript;

interface JavaScript{
  void setColor( int rr, int gg, int bb);
}


void bindJS(JavaScript js){
 javascript = js;
}




