int findBMU(House h)
{
  int win = 0;
  float minDist = width+height;
  for (int i=0; i<outs.length; i++)
  {
    float d = dist(outs[i].w[0], outs[i].w[1], h.pos[0], h.pos[1]);
    if (d<minDist)
    {
      minDist = d;
      win = i;
    }
  }

  return win;
}

void updateW(House h, int bmu)
{
  for (int i=0; i<outs.length; ++i)
  {
    outs[i].w[0]+=learning*Gauss(bmu, i)*(h.pos[0]-outs[i].w[0]);
    outs[i].w[1]+=learning*Gauss(bmu, i)*(h.pos[1]-outs[i].w[1]);
  }
}

float Gauss(int bmu_index, int out_index)
{
  float f = exp(-sq(out_index-bmu_index)/(2*sq(R)));
  int f1 = bmu_index-nHouse;
  f+= exp(-sq(out_index-f1)/(2*sq(R)));
  f1 = bmu_index+nHouse;
  f+= exp(-sq(out_index-f1)/(2*sq(R)));

  return f;
}

void trainOne(House h)
{
  int bmu_index = findBMU(h);
  updateW(h, bmu_index);
}

void trainAll()
{
  for(int i=0; i<nHouse; i++)
  {
    trainOne(houses[i]);
  }
}
