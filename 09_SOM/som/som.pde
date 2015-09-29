int nHouse = 5;
House [] houses;
Out [] outs; 
float R;
float learning = 0.1; 

void setup()
{
  size(500,500);
  rectMode(CENTER);

  randomHouses();
  setupOuts();
}

void draw()
{
  R*=0.99;
  learning*=0.999;
  trainAll();
  
  background(255);
  displayHouses();
  displayOuts();
}
