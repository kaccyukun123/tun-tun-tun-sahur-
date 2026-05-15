int xPos = 0;
int yPos = 480;



int leftScore = 0;
int rightScore = 0;
Player rightP = new Player();
Player leftP = new Player();


PImage photo;


boolean paused = false;

boolean leftPunch = false;
boolean rightPunch = false;

int punchTime = 10;

int leftCooldown = 0;
int rightCooldown = 0;





void settings() {
  pixelDensity(1);
  size(1067, 600);
  photo = loadImage("fightBackground.jpg");
}
void draw() {
  background(photo);
  if (paused) {   // Pause screen
    background(0);
    fill(255);
    textSize(40);
    text("PAUSED", width / 2-100, height/ 2);
    return;
  }

  drawPlayer();
  drawHitBox();
  playerPunch();
  drawScore();
  checkPlayerMovement();

}


void drawPlayer() {
  leftP.PlayerX += leftP.PlayerSpeed;
  rightP.PlayerX += rightP.PlayerSpeed;

  // LEFT player body
  rect(leftP.PlayerX, leftP.PlayerY, 100, 350);
  //rect(leftP.PlayerX, leftP.PlayerY + 150, 180, 110);

  // RIGHT player body (flipped arm)
  rect(rightP.PlayerX, rightP.PlayerY, 100, 350);
  //rect(rightP.PlayerX, rightP.PlayerY + 150, -180, 110);
  
}
void drawHitBox(){
  fill(0);
  rect(leftP.PlayerX, leftP.PlayerY + 150, 100, 110);
  rect(rightP.PlayerX, rightP.PlayerY + 150, 100, 110);
}

void checkPlayerMovement() {
  if (leftP.PlayerX > 1067 - 100) {
    leftP.PlayerX = 1067 - 100;
    leftP.PlayerSpeed = 0;
  }
  if (rightP.PlayerX < 0) {
    rightP.PlayerSpeed = 0;
    rightP.PlayerX = 0;
  }
  if (rightP.PlayerX > 1067 - 100) {
    rightP.PlayerX = 1067 - 100;
    rightP.PlayerSpeed = 0;
  }
  if (leftP.PlayerX < 0) {
    leftP.PlayerSpeed = 0;
    leftP.PlayerX = 0;
  }

}
void playerPunch(){

if (leftPunch) {

    

      rightScore++;
      leftPunch = false;
    }
  

if (rightPunch) {

   

      leftScore++;
      rightPunch = false;
    }
  }




void drawScore() {
  textSize(32);
  fill(255);
  text(leftScore, 250, 50);
  text(rightScore, 750, 50);
}

void keyPressed() {
  if (key == 'p') {
    paused = !paused;
  }
  if (keyCode == LEFT) {
    rightP.PlayerSpeed = -7;
  } else if (keyCode == RIGHT ) {
    rightP.PlayerSpeed = 7;
  } else if (keyCode == DOWN) {
    rightP.PlayerSpeedY = 2;
  }
  
  if (key == 'a') {
    leftP.PlayerSpeed = -7;
  } else if (key == 'd') {
    leftP.PlayerSpeed = 7;
  }
  if (key == 'r') {
    leftScore = 0;
    rightScore = 0;

    loop();
  }
  
  if (key == 'w') {
    leftPunch = true;
  }
  
  if (key == DOWN) {
    rightPunch = true;
  }
}



void keyReleased() {
  if (keyCode == LEFT) {
    rightP.PlayerSpeed = 0;
  } else if (keyCode == RIGHT) {
    rightP.PlayerSpeed = 0;
  }
  if (key == 'a') {
    leftP.PlayerSpeed = 0;
  } else if (key == 'd') {
    leftP. PlayerSpeed = 0;
  }
}
