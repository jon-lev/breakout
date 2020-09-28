ArrayList<Block> blockList = new ArrayList<Block>();
final int ROWS = 10;
final int[] colors = {0xffFF0000, 0xffFFA500, 0xffFFD700, 0xff00FF00, 0xff0000FF, 0xff7F00FF, 0xff6a0dad, 0xff4B0082};
final int COLUMNS = 7;
final float BRICKWIDTH = 40;
final float BRICKHEIGHT = 20;
final float PADDLEWIDTH = 60;
final float PADDLEHEIGHT = 5;
final float PADDLEY = 620;
final float BALLSTARTX = 245;
final float BALLSTARTY = 385;
final float BALL_RADIUS = 5;
final float MARGIN = 60;
final float ACCELERATION = 0.01;
final color GRAY = #3c3c3d;
float lives = 3;
int gameScreen = 0; //0 == Main Menu, 1 == Game, 2 == Over, 3 == Win
Ball ball;
Paddle paddle;



void setup(){
  size(500,640);
  background(0);
  createBlockList();
  ball = new Ball();
  paddle = new Paddle();
}

void draw(){
  frameRate(60);
  if(gameScreen == 0){
    drawHome();
    if(mousePressed && mouseX < 350 && mouseX > 125 && mouseY > 250 && mouseY < 325 )
    {
      blockList.clear();
      createBlockList();
      gameScreen = 1;
      ball.ballReset();
      lives = 3;
    }
  }
  
  if(gameScreen == 1){
  smooth();
  background(GRAY);
  if(!ball.moving)
  {
   if(keyPressed && key == ' ') ball.ballStart(); 
  }
  lives();
  drawBlocks();
  ball.drawBall();
  ball.move();
  ball.outOfBounds();
  collision();
  paddle.drawPaddle();
  paddle.checkBounce();
  }
  
  if(gameScreen == 2){
     gameOver(); 
  }
  if(gameScreen == 3){
     gameWin(); 
  }
}

void gameOver(){
  background(GRAY);
  //Gameover text
  fill(255,0,0);
  textSize(60);
  stroke(255);
  text("GAME OVER!", 65, 300);
  textSize(20);
  text("PRESS 'H' TO GO BACK TO MAIN MENU",60,325);
  if(keyPressed && (key == 'H' || key == 'h')) gameScreen = 0;
  //Click anywhere to go back home
}

void gameWin(){
  background(GRAY);
  fill(#FFD700);
  textSize(60);
  stroke(255);
  text("YOU WON", 105, 300);
  textSize(20);
  text("PRESS 'H' TO GO BACK TO MAIN MENU",60,325);
  if(keyPressed && (key == 'H' || key == 'h')) gameScreen = 0;
}

void lives(){
  textSize(20);
  text("Lives: " + lives, MARGIN, MARGIN);
  if(lives <= 0)
  {
   gameScreen = 2;
   lives = 3;
   paddle.x = width/2; 
  }
}
void drawHome(){
    background(0);
    fill(0xff3c3c3d);
    noStroke();
    rect(0,0,width,100);
    rect(0,500,width,120);
    strokeWeight(3);
    stroke(0,255,0);
    fill(0);
    rect(125 ,250, 225, 75);
    fill(255);
    String title = "Breakout";
    String instructions = "INSTRUCTIONS:\nCLICK TO START THE GAME\nUSE SPACE TO SHOOT THE BALL\nUSE THE LEFT AND RIGHT ARROWS TO MOVE";
    String author = "Created by Jon Levin";
    String start = "START";
    
    textSize(70);
    text(title,90,75);
    fill(0,255,0);
    text(start,127,315);
    textSize(10);
    text(author, 400, 630); 
    textSize(20);
    fill(0xffFFD700);
    text(instructions,0,500,width,200);
    
    
}



void createBlockList()
{
  //Empty Block so list doesn't go null
  //blockList.add(new Block(0,0,0));
  for(int i = 0; i < ROWS; i++)
  {
    for(int j = 0; j < COLUMNS; j++)
    {
       Block block = new Block(BRICKWIDTH * i + MARGIN,BRICKHEIGHT * j + (MARGIN*2),colors[j]);
       blockList.add(block);
    } 
  }
}

void drawBlocks(){
  
 for(int i = 0; i < blockList.size(); i++)
 {
   Block block = blockList.get(i);
   block.displayBlock();
 }
}

void collision(){
 if(blockList.size() <= 0) gameScreen = 3;
 for(int i = blockList.size() - 1; i >= 0; i--){
  Block block = blockList.get(i);
  if(block.checkHit())
   {
    blockList.remove(block); 
   } 
 }
}
