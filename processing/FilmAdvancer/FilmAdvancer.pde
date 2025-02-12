FilmStrip filmStrip;
boolean showPreview = true;

void setup() {
  size(1280, 720, P2D);
  
  setupCapture(); 
  
  filmStrip = new FilmStrip(camW, camH);
}

void draw() {
  background(0);
  
  filmStrip.run();
  
  if (showPreview) {
    tint(255, 63);
    image(video, 0, 0, width, height);
    tint(255);
  }
}
