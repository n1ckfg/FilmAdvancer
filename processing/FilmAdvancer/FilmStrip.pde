class FilmStrip {
  
  int numFrames = 36;
  int frameWidth = 1024;
  int frameHeight = 1024;
  float framePosition = 0.0;
  
  PImage[] frames = new PImage[numFrames];
  PGraphics buffer;
  
  FilmStrip() {
    buffer = createGraphics(frameWidth, frameHeight, P2D);
    
    for (int i=0; i<numFrames; i++) {
      frames[i] = createImage(frameWidth, frameHeight, RGB);
    }
  }

  void draw() {
    buffer.beginDraw();
    buffer.background(255,0,0);
    buffer.endDraw();
    image(buffer, 0, 0);
  }
  
}
