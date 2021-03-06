class board
{
   final int EMPTY = 0;
   final int BLACK = 1;
   final int RED = 2;
   int[][] board = new int[6][7];
   
   public board()
   {
      for (int i = 0; i < 6; i++)
      {
        for (int j = 0; j < 7; j++)
        {
          board[i][j] = EMPTY;
        }
      } 
   }
   
   public void show()
   {
      for (int i = 0; i < 6; i++)
      {
         for (int j = 0; j < 7; j++)
         {
            //System.out.println((float);
            stroke(0);
            fill(255);
            rect(width * (float)j/7, height * (float)(i+1)/7, width/7, height/7);
            
            if (board[i][j] == RED)
            {
              fill(0);
              ellipse(width * (float)j/7 + width/14, height * float(i+1)/7 + height/14, min(width, height)/10, min(width,height)/10);
            }
            else if (board[i][j] == BLACK)
            {
              fill(255, 0, 0);
              ellipse(width * (float)j/7 + width/14, height * float(i+1)/7 + height/14, min(width, height)/10, min(width,height)/10);
            }
         }
      }
   }

   public boolean drop (int col, int c)
   {
     for (int i = 5; i >= 0; i--)
     {
        if (board[i][col] == EMPTY)
        {
            board[i][col] = c;
            return true;
        }
     }
     return false;
   }
   boolean inbounds(int a, int b, int c)
   {
      if (a < b || a > c)
        return false;
      else
        return true;
   }
   public boolean checkfull()
   {
      for (int i = 0; i < 6; i++)
      {
         for (int j = 0; j < 7; j++)
         {
           if (board[i][j] == EMPTY)
             return false;
         }
      }
      return true;
   }
   public boolean checkwin(int player)
   {
     for (int r = 0; r < 6; r++)
     {
       for (int c = 0; c < 7; c++)
       {
         for (int i = -1; i <= 1; i++)
         {
            for (int j = -1; j <=1; j++)
            {
              if (j == 0 && i == 0)
                continue;
                
              for (int count = 0; count < 4; count++)
              {
                if (!inbounds(r+count*i, 0, 5) || !inbounds(c + count*j, 0, 6))
                  break;
                if (board[r + count*i][c + count * j] != player)
                  break;
                else if (count == 3)
                {
                  System.out.println("Player " + player + " wins!");
                  return true;
                } 
              }
            }
         }
       }
     }
     return false;
   }
}