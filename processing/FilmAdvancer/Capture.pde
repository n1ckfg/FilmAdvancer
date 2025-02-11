import processing.video.*;

Capture video;
int camW = 640;
int camH = 480;
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
