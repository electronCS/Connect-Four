board board;
int turn = 1;
final int PLAYER1 = 1;
final int PLAYER2 = 2;
int over = 0;
void setup()
{
  size(600, 500);
  board = new board();
}

void draw()
{
  background(255);
  
  if (over == 0)
  {
    for (int i = 0; i < 7; i++)
    {
       fill(255);
       stroke(0);
       rect(width * (float)i/7, 0, width/7, height/7); 
    }
    for (int i = 0; i < 7; i++)
    {
       fill(50);
       stroke(0);
       textSize(32);
       text(i+1, width * (float)i/7 + width/14, 50);
    }
  
    board.show();
   }
  else
  {
    String s;
    if (over != 4)
    {
      s = "Player " + over + " wins!";
    }
    else
    {
       s = "It's a draw"; 
    }
    
    textSize(50);
    fill (0);
    text(s, 100, 100);
  }
  
  
}
boolean overRect (float x, float y, float wid, float h)
{
  if (mouseX >= x && mouseX <= x+wid && mouseY >= y && mouseY <= y+h) 
  {
    return true;
  } 
  else 
  {
    return false;
  }
}
void mousePressed()
{
  for (int i = 0; i < 7; i++)
  {
     if (overRect(width * (float)i/7, 0, width/7, height/7))
     {
       if (board.drop(i, turn) == true)
       {
         if (board.checkwin(turn) == true)
           over = turn;
         if (board.checkfull() == true)
           over = 4;
         switchturns();
       }
     }
  }
}
void switchturns()
{
   if (turn == PLAYER1)
     turn = PLAYER2;
   else
     turn = PLAYER1;
}