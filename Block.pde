class Block {
  float x;
  float y;
  color c;

  Block(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }

  boolean checkHit() {
    //top
    if(ball.getX() > x - BALL_RADIUS &&
       ball.getX() < x + BRICKWIDTH + BALL_RADIUS &&
       abs(ball.getY() - (y - BALL_RADIUS)) < BALL_RADIUS)
    {
      ball.flipY();
      return true;
    }
    
    // bottom
    if(ball.getX() > x - BALL_RADIUS &&
       ball.getX() < x + BRICKWIDTH + BALL_RADIUS &&
       abs(ball.getY() - (y + BRICKHEIGHT + BALL_RADIUS)) < BALL_RADIUS)
    {
      ball.flipY();
      return true;
    }
    
    // left
    if(ball.getY() > y - BALL_RADIUS &&
       ball.getY() < y + BRICKHEIGHT + BALL_RADIUS &&
       abs(ball.getX() - (x - BALL_RADIUS)) < BALL_RADIUS)
    {
      ball.flipX();
      return true;
    }
       
    //right
    if(ball.getY() > y - BALL_RADIUS &&
       ball.getY() < y + BRICKHEIGHT + BALL_RADIUS &&
       abs(ball.getX() - (x + BRICKWIDTH + BALL_RADIUS)) < BALL_RADIUS)
    {
      ball.flipX();
      return true;
    }
    return false;
  }




void displayBlock() {
    noStroke();
    fill(c);
    rect(x, y, BRICKWIDTH, BRICKHEIGHT);
  }
}
