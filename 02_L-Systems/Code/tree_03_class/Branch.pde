class Branch
{
  PMatrix3D joint;
  Branch child_a;
  Branch child_b;

  Branch()
  {
    joint = new PMatrix3D(); // identity matrix
    child_a = null;
    child_b = null;
  }

  void replace(int depth)
  {
    if (depth>10) return;
    if (child_a != null) child_a.replace(depth+1);
    if (child_b != null) child_b.replace(depth+1);
    rule();
  }

  void rule()
  {
    if (child_a == null)
    {
      child_a = new Branch();
      child_a.joint.rotateY(random(0, PI));
      child_a.joint.rotateX(random(-PI/4, PI/4));
    }
    if (child_b == null)
    {
      child_b = new Branch();
      child_b.joint.rotateY(random(0, PI));
      child_b.joint.rotateX(random(-PI/4, PI/4));
    }
  }

  void display()
  {
    applyMatrix(joint);
    pushMatrix();
    translate(0, -height/6, 0);
    box(10, height/3, 10);
    popMatrix();

    pushMatrix();
    translate(0, -height/3, 0);
    scale(0.7);
    if (child_a != null) child_a.display();
    popMatrix();


    pushMatrix();
    translate(0, -height/3, 0);
    scale(0.7);
    if (child_b != null) child_b.display();
    popMatrix();
  }
}

