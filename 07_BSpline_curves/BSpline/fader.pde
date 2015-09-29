float fader(float u, int k)
{
  return basisN(u, k, D);
}

float basisN(float u, int k, int d)
{
  if(d==0) return basis0(u,k);
  else
  {
  float b1 = basisN(u, k, d-1)*(u-knots[k])/(knots[k+d]-knots[k]);
  float b2 = basisN(u, k+1, d-1)*(knots[k+d+1]-u)/(knots[k+1+d]-knots[k+1]);
  return b1+b2;
  }
}

float basis0(float u, int k)
{
  if(u>knots[k] && u<knots[k+1]) return 1;
  else return 0;
}
