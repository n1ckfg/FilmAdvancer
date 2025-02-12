class FilmStrip {
  
  int numFrames = 36;
  int frameW, frameH;
  int frameOffset = 0;
  int frameOffsetStep = 10;
  int currentFrame = 0;
  int reviewFrame = 0;
  
  PGraphics[] frames = new PGraphics[numFrames];
  PGraphics buffer;
  
  boolean armCapture = false;
  boolean reviewMode = false;
  boolean showPreview = true;
  
  int markTime = 0;
  
  FilmStrip(int _frameW, int _frameH) {
    frameW = _frameW;
    frameH = _frameH;
    buffer = createGraphics(frameW, frameH, P2D);
    buffer.beginDraw();
    buffer.background(0);
    buffer.endDraw();
    
    for (int i=0; i<numFrames; i++) {
      frames[i] = createGraphics(frameW, frameH, P2D);
      frames[i].beginDraw();
      frames[i].imageMode(CORNER);
      frames[i].background(0);
      frames[i].blendMode(LIGHTEST);
      frames[i].endDraw();
    }
  }

  void update() {
    if (armCapture) {          
      buffer.beginDraw();
      if (currentFrame < numFrames-1) {
        frames[currentFrame].beginDraw();
        frames[currentFrame].image(video, -frameOffset, 0, frameW, frameH);
        frames[currentFrame].endDraw();
        
        frames[currentFrame+1].beginDraw();
        frames[currentFrame+1].image(video, frameW - frameOffset, 0, frameW, frameH);
        frames[currentFrame+1].endDraw();
        
        buffer.image(frames[currentFrame], -frameOffset, 0);
        buffer.image(frames[currentFrame+1], buffer.width - frameOffset, 0);     
      } else {
        frames[currentFrame].beginDraw();
        frames[currentFrame].image(video, -frameOffset, 0, frameW, frameH);
        frames[currentFrame].endDraw();
        
        frames[0].beginDraw();
        frames[0].image(video, frameW - frameOffset, 0, frameW, frameH);
        frames[0].endDraw();
        
        buffer.image(frames[currentFrame], -frameOffset, 0);
        buffer.image(frames[0], buffer.width - frameOffset, 0);     
      }
      buffer.endDraw();
      
      frames[currentFrame].beginDraw();
      frames[currentFrame].image(buffer, 0, 0, frames[currentFrame].width, frames[currentFrame].height);
      frames[currentFrame].endDraw();
      
      frameAdvance(true);
      armCapture = false;
    }
  }
  
  void frameCapture() {
      armCapture = true;
  }
  
  void frameAdvance(boolean _b) {
    if (reviewMode) {
      if (_b) {
        reviewFrame++;
        if (reviewFrame > numFrames-1) reviewFrame = 0;
      } else {
        reviewFrame--;
        if (reviewFrame < 0) reviewFrame = numFrames-1;
      }
    } else {
      if (_b) {
        currentFrame++;
        if (currentFrame > numFrames-1) currentFrame = 0;
      } else {
        currentFrame--;
        if (currentFrame < 0) currentFrame = numFrames-1;
      }
    }
    
    println("Current frame: " + currentFrame + ", Review frame: " + reviewFrame + ", Offset: " + frameOffset);
  }
  
  void toggleReviewMode() {
    reviewMode = !reviewMode;
    reviewFrame = currentFrame;
  }
  
  void togglePreview() {
    showPreview = !showPreview;
  }
  
  void frameOffsetLeft() {
    frameOffset += 10;
    if (frameOffset > frameW) frameOffset = frameW;
  }
  
  void frameOffsetRight() {
    frameOffset -= 10;
    if (frameOffset < -frameW) frameOffset = -frameW;
  }
  
  void draw() {
    if (reviewMode) {
      if (reviewFrame > 0) {
        image(frames[reviewFrame-1], 0, 0, width, height);     
      } else {
        image(frames[numFrames-1], 0, 0, width, height);     
      }
      fill(0);
      text("Review ... " + reviewFrame, 12, 22);
      text("Review", 12, height-20);
      text("Review", width-52, height-20);
      text("Review", width-52, 22);
      fill(255);
      text("Review ... " + reviewFrame, 10, 20);
      text("Review", 10, height-18);
      text("Review", width-50, height-18);
      text("Review", width-50, 20);
    } else {
      if (currentFrame > 0) {
        image(frames[currentFrame-1], 0, 0, width, height);     
      } else {
        image(frames[numFrames-1], 0, 0, width, height);     
      }
      
      if (showPreview) {
        tint(255, 63);
        image(video, 0, 0, width, height);
        
        stroke(0, 127, 127);       
        line(width/2, 0, width/2, height);
        
        stroke(255, 127, 0);
        line(width/2 - frameOffset, 0, width/2 - frameOffset, height);
        
        tint(255);
      }
    }
  }
  
  void run() {
    update();
    draw();
  }
   
}
