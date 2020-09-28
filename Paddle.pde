class Paddle{
  float x;
  Paddle(){
   this.x = width/2; 
  }
  
  void drawPaddle(){
   stroke(0);
   fill(0,255,0);
   rect(x,PADDLEY, PADDLEWIDTH, PADDLEHEIGHT); 
   if(keyPressed && keyCode == LEFT) paddleLeft();
   if(keyPressed && keyCode == RIGHT) paddleRight();
   x = constrain(x,0, width - PADDLEWIDTH);
  }
  
  void paddleLeft(){
    
   x -= 10; 
  }
  
  void paddleRight(){
   x+= 10; 
  }
  
  void checkBounce(){
    if(ball.getY() > PADDLEY - BALL_RADIUS && ball.getX() > x - BALL_RADIUS && ball.getX() < x + PADDLEWIDTH + BALL_RADIUS)
    {
      ball.flipY();
    }
    
  }
}
