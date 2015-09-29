PVector [][] ctrl_pts;
int N_u, N_v;

float [] knots_u;
float [] knots_v;
int D_u, D_v;

void setup()
{
   size(400, 400, P3D);
  colorMode(HSB, 1.0);
  background(0);
  lights();
  noStroke();
  translate(0, 0, -height);
  makeCtrlPts();
  makeKnots();
  for (float u = knots_u[D_u]; u <= knots_u[knots_u.length-D_u-1]; u += 0.01) {
    for (float v = knots_v[D_v]; v <= knots_v[knots_v.length-D_v-1]; v += 0.01) {
      fill(1);
      surfPos(u, v);
    }
  }
  for (int i = 0; i <= N_u; i++) {
    for (int j = 0; j <= N_v; j++) {
      fill(0.5, 1, 1);
      pushMatrix();
      translate( ctrl_pts[i][j].x, ctrl_pts[i][j].y, ctrl_pts[i][j].z );
      sphere(8);
      popMatrix();
    }
  }
}



void makeCtrlPts()
{
  N_u = N_v = 4;
  ctrl_pts = new PVector [N_u+1][N_v+1];
  for (int i = 0; i <= N_u; i++) {
    for (int j = 0; j <= N_v; j++) {
      ctrl_pts[i][j] =
        new PVector(i*width/N_u, random(height), j*height/N_v);
    }
  }
}

void makeKnots()
{
  D_u = D_v = 2;
  knots_u = new float [N_u + D_u + 2];
  knots_v = new float [N_v + D_u + 2];
  for (int i = 0; i < knots_u.length; i++) {
    knots_u[i] = float(i) / float(N_u + D_u + 1);
  }
  for (int j = 0; j < knots_u.length; j++) {
    knots_v[j] = float(j) / float(N_v + D_v + 1);
  }
}

