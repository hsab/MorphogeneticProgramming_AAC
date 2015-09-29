int xNum = 50;
int yNum = 50;
int cellSize = 10;
int xSize = xNum*cellSize;
int ySize = yNum*cellSize;

boolean [][] state = new boolean[xNum][yNum];
boolean [][] nextState = new boolean[xNum][yNum];


void setup()
{  
  size(xSize, ySize);
  
  for(int i=0; i<xNum; i++)
  {
    for(int j=0; j<yNum; j++)
    {
      state[i][j] = false;
    }
  }

  glider(25, 25);
  //frameRate(1);
}

void draw()
{ 
  background(255);  
  //draw live cells
  for(int i=0; i<xNum; i++)
  {
    for(int j=0; j<yNum; j++)
    {
      if(state[i][j] == true)
      {  
        fill(0);
        rect(i*cellSize, j*cellSize, cellSize, cellSize);
      }
        //count alive neighbours
        int aliveCells = 0;
        for(int m=-1; m<=1; m++)
        {
          for(int k=-1; k<=1; k++)
          {
            if(!(m==0 && k==0))
            {
              if(state[(m+i+xNum)%xNum][(k+j+yNum)%yNum]==true)
              {
                aliveCells++;
              }
            }
          }
        }
        //set next generation
        if(aliveCells<2 || aliveCells>3)
        {
          nextState[i][j] = false;
        }
        else if(aliveCells==3 )
        {
          nextState[i][j] = true;
        }
        else
        {
          nextState[i][j] = state[i][j];
        }
      }
    }
  

  for(int i=0; i<xNum; i++)
  {
    for(int j=0; j<yNum; j++)
    {
      state[i][j] = nextState[i][j];
    }
  }
}

void glider(int x, int y)
{
  state[x][y] = true;
  state[x-1][y] = true;
  state[x+1][y] = true;
  state[x+1][y-1] = true;
  state[x][y-2] = true;
}


