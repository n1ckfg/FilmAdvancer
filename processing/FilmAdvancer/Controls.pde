void keyPressed() { 
  if (key == ' ' && !filmStrip.reviewMode) filmStrip.frameCapture(); 
  if (key == 'z') filmStrip.toggleReviewMode(); 
  if (key == 'x') filmStrip.togglePreview();
}
