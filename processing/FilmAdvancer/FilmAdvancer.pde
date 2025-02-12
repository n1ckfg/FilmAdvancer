FilmStrip filmStrip;

void setup() {
  size(1280, 720, P2D);
  
  setupCapture(); 
  
  filmStrip = new FilmStrip(camW, camH);
}

void draw() {
  background(0);
  
  if (keyPressed) {
    if (key == ' ' && filmStrip.reviewMode) filmStrip.frameAdvance(); 
  
    if (keyCode == LEFT) filmStrip.frameOffsetLeft();
  
    if (keyCode == RIGHT) filmStrip.frameOffsetRight();
  }
  
  filmStrip.run(); 
}
