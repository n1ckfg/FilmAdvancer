class FilmStrip {
  
  int numFrames = 36;
  int frameW = 1280;
  int frameH = 960;
  float frameOffset = 0.0;
  int currentFrame = 0;
  
  PImage[] frames = new PImage[numFrames];
  PGraphics buffer;
  
  boolean armCapture = false;
  
  FilmStrip() {
    frameW = camW;
    frameH = camH;
    buffer = createGraphics(frameW, frameH, P2D);
    buffer.beginDraw();
    buffer.background(0);
    buffer.blendMode(ADD);
    buffer.endDraw();
    
    for (int i=0; i<numFrames; i++) {
      frames[i] = createImage(frameW, frameH, RGB);
    }
  }

  void update() {
    if (armCapture) {
      frames[currentFrame] = video;
      
      buffer.beginDraw();
      if (currentFrame < numFrames-1) {
        buffer.image(frames[currentFrame], frameOffset, 0, buffer.width, buffer.height);
        buffer.image(frames[currentFrame+1], frameOffset - buffer.width, 0, buffer.width, buffer.height);     
      } else {
        buffer.image(frames[currentFrame], frameOffset, 0, buffer.width, buffer.height);
        buffer.image(frames[0], frameOffset - buffer.width, 0, buffer.width, buffer.height);     
      }
      buffer.endDraw();
    
      frameAdvance();
      armCapture = false;
    }
  }
  
  void frameAdvance() {
      currentFrame++;
      if (currentFrame > numFrames-1) {
        currentFrame = 0;
        frameOffset = 0;
      }
  }
  
  void draw() {
    image(buffer, 0, 0, width, height);
  }
  
  void run() {
    update();
    draw();
  }
  
}
