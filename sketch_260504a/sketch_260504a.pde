int xPos = 0;
int yPos = 480;



int leftScore = 0;
int rightScore = 0;
Player rightP = new Player();
Player leftP = new Player();


PImage photo;


boolean paused = false;

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
  drawScore();
  checkPlayerMovement();
}


void drawPlayer() {
  rect(leftP.PlayerX, leftP.PlayerY, 100, 350);
  rect(rightP.PlayerX, rightP.PlayerY, 100, 350);

  rightP.PlayerX += rightP.PlayerSpeed;
  leftP.PlayerX += leftP.PlayerSpeed;
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
  }else  (keyCode == DOWN){
     rightP.PlayerSpeedY = 2;
  }}
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
