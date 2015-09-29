Particle a;// = new Particle();
Particle b;// = new Particle();

//Global Variables
float k  = 1.0;  //spring constant
float mass = 1000.0; //mass
float rest = 100.0; //resting position
float damping = 0.9999;

void setup()
{
  size(400,400);
  smooth();
  //noStroke();
  a = new Particle();
  b = new Particle();
}

void draw()
{
  background(255);
  
  //1 - react (add acceleration to velocity and check boundary conditions
  a.react(b);
  b.react(a);

  //2 - add velocity to position
  a.move();
  b.move();
  
  //3 - draw spring
  stroke(0,50);
  line(a.position.x,a.position.y,b.position.x,b.position.y);
  
  //4 - draw particles
  a.draw();
  b.draw();
}



void mousePressed()
{
  a = new Particle();
  b = new Particle();
}

