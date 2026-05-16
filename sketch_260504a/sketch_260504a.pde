float gravity = 0.8;
int ground = 250;


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
  plsyerCollisonGround();
  drawHitBox();
  playerPunch();
  drawScore();
  checkPlayerMovement();

}


void drawPlayer() {
  leftP.PlayerX += leftP.PlayerSpeed;
  rightP.PlayerX += rightP.PlayerSpeed;

  
  rect(leftP.PlayerX, leftP.PlayerY, 100, 350);
  //rect(leftP.PlayerX, leftP.PlayerY + 150, 180, 110);

  rect(rightP.PlayerX, rightP.PlayerY, 100, 350);
  //rect(rightP.PlayerX, rightP.PlayerY + 150, -180, 110);
  
  
   leftP.PlayerY += leftP.PlayerSpeedY;
   leftP.PlayerSpeedY += gravity;

  rightP.PlayerY += rightP.PlayerSpeedY;
  rightP.PlayerSpeedY += gravity;
}
void drawHitBox(){
  fill(0);
  rect(leftP.PlayerX, leftP.PlayerY + 150, 100, 110);
  rect(rightP.PlayerX, rightP.PlayerY + 150, 100, 110);
}

void plsyerCollisonGround(){

    if (leftP.PlayerY >= ground) {
  leftP.PlayerY = ground;
  leftP.PlayerSpeedY = 0;
  leftP.onGround = true;
}

if (rightP.PlayerY >= ground) {
  rightP.PlayerY = ground;
  rightP.PlayerSpeedY = 0;
  rightP.onGround = true;
}
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

    int punchX = leftP.PlayerX + 100;
    int punchY = leftP.PlayerY + 150;
    int punchW = 60;
    int punchH = 40;

    fill(0);
    rect(punchX, punchY, punchW, punchH);

    if (checkHit(punchX, punchY, punchW, punchH,
    rightP.PlayerX, rightP.PlayerY + 150, 100, 110)) {


      leftScore++;
      leftPunch = false;
    }
}

if (rightPunch) {
    int punchX = rightP.PlayerX - 60;
    int punchY = rightP.PlayerY + 150;
    int punchW = 60;
    int punchH = 40;

    fill(0);
    rect(punchX, punchY, punchW, punchH);

    if (checkHit(
      punchX, punchY, punchW, punchH,
      leftP.PlayerX, leftP.PlayerY + 150, 100, 110
      )) {


      rightScore++;
      rightPunch = false;
    }
   
}}



boolean checkHit(
  int x1, int y1, int w1, int h1,
  int x2, int y2, int w2, int h2
) {

  return x1 < x2 + w2 &&
         x1 + w1 > x2 &&
         y1 < y2 + h2 &&
         y1 + h1 > y2;




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
  
  if (key == 's') {
    leftPunch = true;
  }
  
  if (keyCode == DOWN) {
    rightPunch = true;
  }
  
  if (key == 'w' && leftP.onGround) {
    leftP.PlayerSpeedY = -15;
    leftP.onGround = false;
  }
   if (keyCode == UP && rightP.onGround) {
    rightP.PlayerSpeedY = -15;
    rightP.onGround = false;
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
