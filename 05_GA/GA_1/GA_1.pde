Population p;
int popNum = 100;
int numRows = (int)sqrt(popNum);
import java.util.Arrays;

void setup()
{
  size(400, 400, P3D);
  p = new Population();
}

void draw()
{
  background(200);
  lights();
  noStroke();
  fill(255);

  for ( int i=0; i<p.pop.length; i++)
  {
    pushMatrix();
    scale(1.0/numRows, 1.0/numRows, 1.0/numRows);
    translate(width*(i%numRows), height*(i/numRows));
    translate(width/2, height/2);
    rotateY(0.01*frameCount);
    p.pop[i].draw();
    popMatrix();
  }
  
  if (frameCount%10==0) p.evolve();
}

Genotype crossover(Genotype a, Genotype b)
{
  Genotype c = new Genotype();

  for (int i=0; i<c.genes.length; i++)
  {
    if (random(0, 1)<0.5)
    {
      c.genes[i] = a.genes[i];
    } else {
      c.genes[i] = b.genes[i];
    }
  }
  return c;
}

Individual breed(Individual a, Individual b)
{
  Individual c = new Individual();

  c.geno = crossover(a.geno, b.geno);
  c.geno.mutate();
  c.pheno = new Phenotype(c.geno);

  return c;
}

