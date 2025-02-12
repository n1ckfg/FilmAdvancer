import processing.video.*;

Capture video;
int camW = 1280;
int camH = 720;
int camFps = 30;
int captureIndex = 0;

void setupCapture() {
  if (System.getProperty("os.name").toLowerCase().startsWith("mac")) {
    video = new Capture(this, camW, camH, "pipeline: autovideosrc");
  } else {
    video = new Capture(this, camW, camH, Capture.list()[captureIndex], camFps);
  }
  video.start();
}

void captureEvent(Capture c) {
  c.read();
}
