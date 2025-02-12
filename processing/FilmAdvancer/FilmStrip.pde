class FilmStrip {
  
  int numFrames = 36;
  int frameW = 1280;
  int frameH = 960;
  int frameOffset = 0;
  int currentFrame = 0;
  
  PGraphics[] frames = new PGraphics[numFrames];
  PGraphics buffer;
  
  boolean armCapture = false;
  
  FilmStrip() {
    frameW = camW;
    frameH = camH;
    buffer = createGraphics(frameW, frameH, P2D);
    buffer.beginDraw();
    //buffer.background(0);
    //buffer.blendMode(ADD);
    buffer.endDraw();
    
    for (int i=0; i<numFrames; i++) {
      frames[i] = createGraphics(frameW, frameH, P2D);
    }
  }

  void update() {
    if (armCapture) {     
      println(frameOffset); 
      
      buffer.beginDraw();
      if (currentFrame < numFrames-1) {
        frames[currentFrame].beginDraw();
        frames[currentFrame].image(video, frameOffset, 0);
        frames[currentFrame].endDraw();
        
        frames[currentFrame+1].beginDraw();
        frames[currentFrame+1].image(video, frameW - frameOffset, 0);
        frames[currentFrame+1].endDraw();
        
        buffer.image(frames[currentFrame], frameOffset, 0, buffer.width, buffer.height);
        buffer.image(frames[currentFrame+1], frameOffset + buffer.width, 0, buffer.width, buffer.height);     
      } else {
        frames[currentFrame].beginDraw();
        frames[currentFrame].image(video, frameOffset, 0);
        frames[currentFrame].endDraw();
        
        frames[0].beginDraw();
        frames[0].image(video, frameW - frameOffset, 0);
        frames[0].endDraw();
        
        buffer.image(frames[currentFrame], frameOffset, 0, buffer.width, buffer.height);
        buffer.image(frames[0], frameOffset + buffer.width, 0, buffer.width, buffer.height);     
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
