void faderPos(float u)
{
  for (int k=0; k<cPt.length; k++)
  {
    float fader_level = fader(u,k);
    faderColor(k); 
    point(u*width, (1-fader_level)*height);
  }
}
