import processing.video.*;

Capture video;
int captureIndex = 0;
FilmStrip filmStrip;
int camW = 640;
int camH = 480;
int camFps = 30;

void setup() {
  size(1024, 1024, P2D);
  
  if (System.getProperty("os.name").toLowerCase().startsWith("mac")) {
    video = new Capture(this, camW, camH, "pipeline: autovideosrc");
  } else {
    video = new Capture(this, camW, camH, Capture.list()[captureIndex], camFps);
  }
  video.start(); 
  
  filmStrip = new FilmStrip();
}

void draw() {
  filmStrip.draw();
}
