/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/7499*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
// A simple swarming algorithm
// (c) Alasdair Turner 2008

Fly [] swarm = new Fly [200];

void setup()
{
  size(400,400);
  colorMode(HSB);
  for (int i = 0; i < swarm.length; i++) {
    swarm[i] = new Fly();
  }
}

void draw()
{
  background(0);
  for (int i = 0; i < swarm.length; i++) {
    swarm[i].move(swarm);
    swarm[i].draw();
  }
}


