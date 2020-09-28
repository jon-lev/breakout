class Ball{
  float maxSpeed = 9;
  PVector location;
  PVector velocity;     //Changes Location
  PVector acceleration; //Changes Velocity
  boolean moving;
  Ball(){
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    moving = false;
  }
  
  float getX(){
   return location.x; 
  }
  
  float getY(){
   return location.y; 
  }
  
  boolean getMoving(){
    return moving;
  }
  
  void drawBall(){
    noStroke();
    fill(255,0,0);
    if(moving == false)
    {
     location.x = paddle.x + PADDLEWIDTH / 2;
     location.y = PADDLEY - BALL_RADIUS;
    }
    ellipse(location.x,location.y,BALL_RADIUS * 2,BALL_RADIUS * 2);
    
  }
  
  void ballStart()
  {
   velocity.y = random(3,5);
   acceleration.x = ACCELERATION;
   acceleration.y = ACCELERATION;
   moving = true;
  }
  
  void move(){ 
   velocity.add(acceleration);
   location.add(velocity);
   velocity.limit(maxSpeed);
  }
  
  
  void outOfBounds(){
   if(location.x > width || location.x < 0)
   {
    flipX();
   }
   if(location.y < 0 + BALL_RADIUS)
   {
    flipY();
   }
   if(location.y > (PADDLEY + PADDLEHEIGHT/2 + 10))
   {
    ballReset(); 
    lives--;
   }
  }
  
  void ballReset()
  {
    velocity.setMag(0);
    acceleration.setMag(0);
    location.x = width/2;
    location.y = height/2;
    moving = false;
  }
  
  void flipY(){
    velocity.y *= -1; 
    acceleration.y *= -1;
  }
  
  void flipX(){
   velocity.x *= -1;
   acceleration.x *= -1;
  }
}
