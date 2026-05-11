int xPos = 0;
int yPos = 480;



int leftScore = 0;
int rightScore = 0;


PImage photo;


boolean paused = false;

void settings() {
  pixelDensity(1);
  size(1067, 600);
  photo = loadImage("fightBackground.jpg");
    

}
void draw(){
  background(photo);
  if (paused) {   // Pause screen
    background(0);
    fill(255);
    textSize(40);
    text("PAUSED", width / 2-100, height/ 2);
    return;  
  }  
  
  drawPlayer();
  drawScore();
  checkPlayerMovement();
  
}


void drawPlayer(){
  rect(leftPlayerX, leftPlayerY, 100, 350);
  rect(rightPlayerX, rightPlayerY, 100, 350);
  
  rightPlayerX += rightPlayerSpeed;
  leftPlayerX += leftPlayerSpeed;
}

void checkPlayerMovement(){
  if (leftPlayerX > 1067 - 100) {
    leftPlayerX = 1067 - 100;
    leftPlayerSpeed = 0;
  }
  if(rightPlayerX < 0){
    rightPlayerSpeed = 0;
    rightPlayerX = 0; 
  }
  if (rightPlayerX > 1067 - 100) {
    rightPlayerX = 1067 - 100;
    rightPlayerSpeed = 0;
  }
  if(leftPlayerX < 0){
    leftPlayerSpeed = 0;
    leftPlayerX = 0;
  }
}

void drawScore(){
  textSize(32);
  fill(255);
  text(leftScore, 250, 50);
  text(rightScore, 750, 50);
 
}

void keyPressed(){
   if (key == 'p') {
    paused = !paused;
   }
    if (keyCode == LEFT) {
     rightPlayerSpeed = -7;
   }
   else if(keyCode == RIGHT ){
     rightPlayerSpeed = 7;
   } 
   if (key == 'a') {
     leftPlayerSpeed = -7;
   }
   else if(key == 'd') {
     leftPlayerSpeed = 7;
   }
    if (key == 'r') {
  leftScore = 0;
  rightScore = 0;
 
  loop();
  }
    
}



void keyReleased(){
  if (keyCode == LEFT) {
     rightPlayerSpeed = 0; 
   }
   else if(keyCode == RIGHT){
     rightPlayerSpeed = 0;
   }
   if (key == 'a') {
     leftPlayerSpeed = 0;
   }
   else if(key == 'd'){
     leftPlayerSpeed = 0;
   }
  
  
}


class player{

int rightPlayerY = 200;
int leftPlayerY = 200;
int rightPlayerX = 940;
int leftPlayer = 50;
int rightPlayerSpeed = 0;
int leftPlayerSpeed = 0;
}

}
