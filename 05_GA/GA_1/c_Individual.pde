class Individual implements Comparable
{
  Genotype geno;
  Phenotype pheno;
  float m_fitness;

  Individual()
  {
    geno = new Genotype();
    pheno = new Phenotype(geno);
    m_fitness = 0.0;
  }

  void draw()
  {
    pheno.draw();
  }

  void evaluate()
  {
    m_fitness = pheno.evaluate();
  }

  int compareTo(Object obj)
  {
    Individual b = (Individual) obj; 
    if (m_fitness > b.m_fitness)
    {
      return 1;
    }
    if (m_fitness < b.m_fitness)
    {
      return -1;
    }
    return 0;
  }  
}

