/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/7501*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
// a boids flock
// (c) Alasdair Turner 2009

Boid [] flock = new Boid [200];

void setup()
{
  size(400,400,P3D);
  colorMode(HSB);
  for (int i = 0; i < flock.length; i++) {
    flock[i] = new Boid();
  }
  // this is a hack for 1.0.9
  ((PGraphics3D)g).cameraNear = -8;
}

void draw()
{
  background(0);
  noStroke();
  lights();
  translate(width/2,height/2,0.0);
  for (int i = 0; i < flock.length; i++) {
    if (frameCount % 500 != 0) {
      flock[i].move(flock);
      flock[i].draw();  
    }
    else {
      flock[i].reset();
    }
  }
}

