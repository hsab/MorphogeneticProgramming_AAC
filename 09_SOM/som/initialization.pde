void randomHouses()
{
  houses = new House[nHouse];
  for (int i=0; i<nHouse; ++i)
  {
    houses[i] = new House();
  }
}
void setupOuts()
{
  outs = new Out[nHouse];
  for (int i=0; i<nHouse; ++i)
  {
    outs[i] = new Out();
  }

  R = 2.0;
}

void displayHouses()
{
  noFill();
  stroke(255, 0, 0);
  for (int i=0; i<nHouse; ++i)
  {
    houses[i].display();
  }
}

void displayOuts()
{
  noFill();
  stroke(0);
  for (int i=0; i<nHouse; ++i)
  {
    int j = (i+1)%nHouse;
    line(outs[i].w[0], outs[i].w[1], outs[j].w[0], outs[j].w[1]);
  }
}

