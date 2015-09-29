class Genotype
{
  int [] genes; 

  Genotype()
  {
    genes  = new int[3];
    for (int i=0; i<genes.length; i++)
    {
      genes[i] = (int)random(256);
    }
  }
  
  void mutate()
  {
    for (int i=0; i<genes.length; i++)
    {
      if (random(100)<5)
      {
        genes[i] = (int)random(256);
      }
    }
  }
}
