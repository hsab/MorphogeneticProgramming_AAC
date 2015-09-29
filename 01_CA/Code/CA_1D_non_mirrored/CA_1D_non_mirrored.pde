color black = color(0);
int row = 1;

//rule 110
//0 1 1 0 1 1 1 0
int [] responce = {0, 1, 1, 1, 0, 1, 1, 0};

void setup()
{
  size(400,400);
  //initial state t=0
  set(399,0,black);  
}

void draw()
{

  for (int i=0; i<width; ++i)
  {
      color a  = get((i-1+width)%width, row-1);
      color b  = get( i, row-1);
      color c  = get((i+1+width)%width, row-1);
      
             
      int num = 0; 
      
      if(a==black)
      {
       num+=4; 
      }
      if(b==black)
      {
       num+=2; 
      }
      if(c==black)
      {
       num+=1; 
      }
      
      if(responce[num]==1)
      {
         set(i,row,black); 
      }
      
  } 
  
  row++;
  
}

