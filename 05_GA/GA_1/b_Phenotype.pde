class Phenotype
{
  float m_width;
  float m_height;
  float m_depth;

  Phenotype(Genotype g)
  {
    m_width = g.genes[0]*width/256;
    m_height = g.genes[1]*height/256;
    m_depth = g.genes[2]*height/256; 
  }
  
  void draw()
  {
    box(m_width, m_height, m_depth);
  }
  
  float evaluate()
  {
    float fitness = 0.0;
    fitness+=sq(m_width+m_height+m_depth);
    fitness-=(m_width*m_height*m_depth);
    return fitness;
  }
  
}

