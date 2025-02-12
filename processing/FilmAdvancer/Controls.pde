void keyPressed() {
  if (key == ' ') filmStrip.armCapture = true;
  
  if (key == 'z') filmStrip.reviewMode = !filmStrip.reviewMode;
  
  if (key == 'x') filmStrip.frameAdvance();

  if (keyCode == LEFT) filmStrip.frameOffset -= 10;

  if (keyCode == RIGHT) filmStrip.frameOffset += 10;
}
