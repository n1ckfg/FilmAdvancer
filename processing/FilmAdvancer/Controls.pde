void keyPressed() { 
  if (!filmStrip.reviewMode) {
    if (key == ' ') filmStrip.frameCapture(); 
  } else {
    if (keyCode == LEFT) filmStrip.frameAdvance(false);
    if (keyCode == RIGHT) filmStrip.frameAdvance(true);    
  }
  if (key == 'z') filmStrip.toggleReviewMode(); 
  if (key == 'x') filmStrip.togglePreview();
}
