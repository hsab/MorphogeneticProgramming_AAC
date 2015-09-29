void curvePos(float u)
{
  PVector pt = new PVector();
  for (int k=0; k<cPt.length; k++)
  {
    PVector ptk = new PVector(cPt[k].x, cPt[k].y); 
    ptk.mult(fader(u, k));
    pt.add(ptk);
  }
  point(pt.x, pt.y);
}

