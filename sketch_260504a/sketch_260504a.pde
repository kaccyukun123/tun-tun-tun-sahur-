int xPos = 0;
int yPos = 480;



boolean paused = false;

void setup(){
      size(1000, 600);
}

void draw(){
  if (paused) {   // Pause screen
    background(0);
    fill(255);
    textSize(40);
    text("PAUSED", width / 2-100, height/ 2);
    return;  
  }
  
  
  background(0);
  rect(xPos, yPos, 10000, 10);
 
}



void keyPressed(){
   if (key == 'p') {
    paused = !paused;
   }
  
}



void keyReleased(){
  
  
  
}
