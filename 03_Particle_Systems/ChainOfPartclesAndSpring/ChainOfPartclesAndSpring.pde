Particle [] chain;

//Global Variables
float k  = 1.0;  //spring constant
float mass = 1000.0; //mass
float rest = 100.0; //resting position
float damping = 0.99;
int numOfPParticle = 10;

void setup()
{
  size(400, 400);
  smooth();
  //noStroke();
  chain = new Particle[numOfPParticle];
  for (int i = 0; i<chain.length; i++)
  {
    chain[i] = new Particle();
  }
}

void draw()
{
  background(255);

  //1 - react (add acceleration to velocity and check boundary conditions
  for (int i = 0; i<chain.length; i++)
  {
    chain[i].react(chain, i);
  }

  //2 - add velocity to position
  for (int i = 0; i<chain.length; i++)
  {
    chain[i].move();
  }

  //3 - draw spring
  for (int i = 0; i<chain.length; i++)
  {
    chain[i].drawSpring(chain, i);
  }

  //4 - draw particles
  for (int i = 0; i<chain.length; i++)
  {
    chain[i].drawParticle();
  }
}



void mousePressed()
{
  for (int i = 0; i<chain.length; i++)
  {
    chain[i] = new Particle();
  }
}

