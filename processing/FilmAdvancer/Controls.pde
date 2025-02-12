void keyPressed() {
  if (key == ' ') {
    if(filmStrip.reviewMode) {
      filmStrip.armCapture = true;
    } else {
      filmStrip.frameAdvance();
    }
  }
  
  if (key == 'z') filmStrip.reviewMode = !filmStrip.reviewMode; 
  if (key == 'x') showPreview = !showPreview;

  if (keyCode == LEFT) filmStrip.frameOffset -= 10;

  if (keyCode == RIGHT) filmStrip.frameOffset += 10;
}
