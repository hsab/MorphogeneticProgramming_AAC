Branch axiom;

void setup()
{
  size(600, 600, P3D);
  axiom = new Branch();
}

void draw()
{
  background(0);
  lights();
  fill(255);
  translate(width/2, height);
  rotateY(frameCount*0.01);
  axiom.display();
  if (frameCount % 100 == 0 ) axiom.replace(0);
}

