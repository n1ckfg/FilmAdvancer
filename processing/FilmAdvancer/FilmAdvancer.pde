FilmStrip filmStrip;

void setup() {
  size(1024, 1024, P2D);
  
  filmStrip = new FilmStrip();
}

void draw() {
  filmStrip.draw();
}
