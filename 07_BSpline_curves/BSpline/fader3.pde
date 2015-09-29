float fader3(float u, int k)
{
  
  float fader_level = 
  pow(u,k)*pow(1-u,N-k)*fac(N)/(fac(k)*fac(N-k));
  return fader_level;
}

float fac(int v)
{
  float f=1;
  for (int i=v; i>1; i--)
  {
    f*=i;
  }
  
  return f;
}
