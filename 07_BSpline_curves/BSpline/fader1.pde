float fader1(float u, float k)
{
  float fader_level; 
  if (k==0)
  {
    fader_level = 1.0-u;
  } else
  {
    fader_level = u-0.0;
  }  
  return fader_level;
}

