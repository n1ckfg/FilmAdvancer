class FilmStrip {
  
  int numFrames = 36;
  int frameW, frameH;
  int frameOffset = 0;
  int currentFrame = 0;
  
  PGraphics[] frames = new PGraphics[numFrames];
  PGraphics buffer;
  
  boolean armCapture = false;
  boolean reviewMode = false;
  int markTime = 0;
  
  FilmStrip() {
    frameW = 1280;
    frameH = 960;
    buffer = createGraphics(frameW, frameH, P2D);
    buffer.beginDraw();
    //buffer.background(0);
    //buffer.blendMode(ADD);
    buffer.endDraw();
    
    for (int i=0; i<numFrames; i++) {
      frames[i] = createGraphics(frameW, frameH, P2D);
      frames[i].beginDraw();
      frames[i].imageMode(CORNER);
      frames[i].endDraw();
    }
  }

  void update() {
    if (armCapture) {          
      buffer.beginDraw();
      if (currentFrame < numFrames-1) {
        frames[currentFrame].beginDraw();
        frames[currentFrame].image(video, frameOffset, 0, frameW, frameH);
        frames[currentFrame].endDraw();
        
        frames[currentFrame+1].beginDraw();
        frames[currentFrame+1].image(video, frameW - frameOffset, 0, frameW, frameH);
        frames[currentFrame+1].endDraw();
        
        buffer.image(frames[currentFrame], -frameOffset, 0);
        buffer.image(frames[currentFrame+1], buffer.width - frameOffset, 0);     
      } else {
        frames[currentFrame].beginDraw();
        frames[currentFrame].image(video, frameOffset, 0, frameW, frameH);
        frames[currentFrame].endDraw();
        
        frames[0].beginDraw();
        frames[0].image(video, frameW - frameOffset, 0, frameW, frameH);
        frames[0].endDraw();
        
        buffer.image(frames[currentFrame], frameOffset, 0);
        buffer.image(frames[0], frameOffset + buffer.width, 0);     
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
      println("Current frame: " + currentFrame);
  }
  
  void draw() {
    if (reviewMode) {
      if (currentFrame > 0) {
        image(frames[currentFrame-1], 0, 0, width, height);
      } else {
        image(frames[numFrames-1], 0, 0, width, height);
      }
    } else {
      image(buffer, 0, 0, width, height);
    }
  }
  
  void run() {
    update();
    draw();
  }
   
}
