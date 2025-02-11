FilmStrip filmStrip;

void setup() {
  size(1280, 960, P2D);
  
  setupCapture(); 
  
  filmStrip = new FilmStrip();
}

void draw() {
  background(0);
  
  tint(255);
  filmStrip.run();
  
  tint(255, 63);
  image(video, 0, 0, width, height);
}
