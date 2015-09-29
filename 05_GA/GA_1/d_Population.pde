class Population
{
  Individual [] pop; 

  Population()
  {
    pop = new Individual[popNum];
    for (int i=0; i<popNum; i++)
    {
      pop[i] = new Individual();
      pop[i].evaluate();
    }
    Arrays.sort(pop);
  }
  
  void evolve()
  {
    Individual a = select();
    Individual b = select();
    Individual x = breed(a,b);
    pop[0] = x;
    x.evaluate();
    Arrays.sort(pop);
  }
  
  Individual select()
  {
    int index = (int) floor(((float) popNum-1-1e-6)*(1.0-sq(random(0,1))));
    
    return pop[index];
  }
}

