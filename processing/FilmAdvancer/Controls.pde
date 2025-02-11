void keyPressed() {
  if (key == ' ') filmStrip.armCapture = true;
  
  if (keyCode == LEFT) filmStrip.frameOffset -= 10;

  if (keyCode == RIGHT) filmStrip.frameOffset += 10;
}
