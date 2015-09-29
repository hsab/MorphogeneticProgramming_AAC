float fader2(float u, float k)
{
  float fader_level=0.0; 
  u*=N;
  
  if (k==int(floor(u)))
  {
    fader_level = ceil(u)-u;
  } 
  else if (k==int(ceil(u)))
  {
    fader_level = u-floor(u);
  }  
  return fader_level;
}

