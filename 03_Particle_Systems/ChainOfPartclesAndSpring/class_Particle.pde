class Particle
{
  //
  PVector position;
  PVector velocity;

  //contructor
  Particle()
  {
    //set particle's initial position and velocity
    position = new PVector(random(0, width), random(0, height));
    velocity = new PVector(random(-1, 1), random(-1, 1));
  }

  void react(Particle [] chain, int me)
  { 
    //1 - check distances between neighboring particles
    //in this case acceleration will be calculated in relation to the reaction of both neighbours
    for (int i = me-1; i<=me+1; i++)
    {
      //make sure boundary particles take into account the start or end of chain
      int i_c = (i+chain.length)%chain.length;

      if (i_c!=me)//check "me" against my neighbors, but NOT myself
      {
        //1 - calculate displacement based on distance between particles and rest length
        float distance = PVector.dist(position, chain[i_c].position);
        float displacement = distance - rest;

        //2 - find acceleration direction - we'll add the force "along" the spring
        PVector acceleration = PVector.sub(chain[i_c].position, position);
        //create a unit vector of the direction
        acceleration.normalize();

        //3 - calculate acceleration based on Newoton's 2nd Law and Hooke's Law of Elasticity
        //Hooke's Law of Elasticity-> F=k*x
        //Acceleration = Force/Mass
        //acceleration = k*displacement/mass
        acceleration.mult(k*displacement/mass);
        
        //4 - Add acceleration to velocity
        velocity.add(acceleration);
      }
    }
    
     //5 - check boundary conditions
    bounce();
    
    //6 - Damp movement, as if taking FRICTION into account
    velocity.mult(damping);
  }

  void move()
  {
    position.add(velocity);
  }

  void drawSpring(Particle [] chain, int me)
  {
    for (int i = me; i<=me+1; i++)
    {
      int i_c = (i+chain.length)%chain.length;
      if (i_c!=me)
      {
        stroke(150);
        line(position.x, position.y, chain[i_c].position.x, chain[i_c].position.y);
      }
    }
  }

  void drawParticle()
  {
    fill(200, 200);
    ellipse(position.x, position.y, 30, 30);
    fill(100, 100);
    ellipse(position.x, position.y, 20, 20);
    fill(0);
    ellipse(position.x, position.y, 5, 5);
  }

  void bounce()
  {
    if((position.x<0 && velocity.x<0)||(position.x>width && velocity.x>0))
    {
      velocity.x=-velocity.x;
    } 
    if((position.y<0 && velocity.y<0) || (position.y>height && velocity.y>0))
    {
      velocity.y=-velocity.y;
    } 
  }
}

