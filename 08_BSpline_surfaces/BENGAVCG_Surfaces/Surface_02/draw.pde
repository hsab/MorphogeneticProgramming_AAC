void drawSurf(float du, float dv)
{
  for (float u = knots_u[D_u]; u <= knots_u[knots_u.length-D_u-1]; u += du) {
    for (float v = knots_v[D_v]; v <= knots_v[knots_v.length-D_v-1]; v += dv) {
      fill(1);
      PVector pt_1 = surfPos(u   , v   );
      PVector pt_2 = surfPos(u+du, v   );
      PVector pt_3 = surfPos(u+du, v+dv);
      PVector pt_4 = surfPos(u   , v+dv);
      beginShape(QUADS);
      vertex(pt_1.x, pt_1.y, pt_1.z);
      vertex(pt_2.x, pt_2.y, pt_2.z);
      vertex(pt_3.x, pt_3.y, pt_3.z);
      vertex(pt_4.x, pt_4.y, pt_4.z);
      endShape();
    }
  }
}

void drawCtrlPts()
{
  for (int i = 0; i <= N_u; i++) {
    for (int j = 0; j <= N_v; j++) {
      fill(0, 1, 1);
      pushMatrix();
      translate( ctrl_pts[i][j].x, ctrl_pts[i][j].y, ctrl_pts[i][j].z );
      sphere(5);
      popMatrix();
    }
  }
}
