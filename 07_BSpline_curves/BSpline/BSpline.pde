PVector [] cPt = {
  new PVector( 60.0, 100.0 ), 
  new PVector( 160.0, 380.0 ), 
  new PVector( 200.0, 120.0 ), 
  new PVector( 340.0, 190.0 ), 
  new PVector( 300.0, 60.0 )
  };

int N = cPt.length-1;


float [] knots = {
  0.0, 0.001, 0.002, 0.5, 0.998, 0.999, 1.0
};


int D = knots.length-cPt.length-1;

void setup()
{
  size(400, 400);
  smooth();
  colorMode(HSB, 1.0);
  background(0);
  strokeWeight(3);

  //draw the CPts
  for (int i=0; i<cPt.length; i++)
  {
    faderColor(i);
    point(cPt[i].x, cPt[i].y);
  }

  //draw curve
  strokeWeight(8);
  stroke(1);  
  for (float u=0.0; u<=1; u+=0.01)
    //for (float u=knots[D]; u<=knots[knots.length-D-1]; u+=0.01)
  {
    curvePos(u);
  }
}

