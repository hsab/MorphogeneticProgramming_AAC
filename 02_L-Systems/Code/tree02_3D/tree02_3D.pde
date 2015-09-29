int seed=0;
void setup()
{
  size(500, 500, P3D);
  
}

void draw()
{
  background(0);
  noStroke();
  randomSeed(seed);
  fill(255);
  lights();
  translate(width/2, height);
  rotateY(frameCount*0.01);
  branch(0);
}

void branch(int depth)
{
  if (depth<10) {

    pushMatrix();
    translate(0, -height/6, 0);
    box(10, -height/3, 10);
    popMatrix();
    
    pushMatrix();
    translate(0, -height/3);
    rotateY(random(0,PI));
    rotateX(random(-PI/4, PI/4));
    scale(0.7);
    branch(depth+1);
    popMatrix();

    pushMatrix();
    translate(0, -height/5);
    rotateY(random(0,PI));
    rotate(random(-PI/4, PI/4));
    scale(0.7);
    branch(depth+1);
    popMatrix();
  }
}

void mousePressed()
{
  seed++;
}

