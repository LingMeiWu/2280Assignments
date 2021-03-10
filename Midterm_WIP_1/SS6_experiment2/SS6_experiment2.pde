// Experimenting with game states: pregame, game, game over
// 1. start in pregame
// 2. click the mouse to start the game
// 3. when game is over transition to game over
// 4. click to transition to pregame

String state = "pregame";

PImage grass;
PImage butterfly;



void setup() {
  size(1280, 720);
  textAlign(CENTER);
  textSize(40);
  
  background(255);
  grass = loadImage("grass.png");
  butterfly = loadImage("butterfly.png"); 
}

void draw() {
    
    
  if (state == "pregame") {
   
    background (240, 200, 100);
    noStroke();
    cloud();
    cloud2();
    cloud3();
    image(butterfly, 60, 340, 100, 100);
    image(grass, 0, 350);
    
    // outer white box
    fill(240);
    rect(375, 220, 600, 200);
    
    // inner yellow box
    fill(240, 200, 100);
    rect(385, 240, 575, 150);
    
    fill(255);
    text("Click to start the game", width/2+30 , height/2-30 );
    
  } else if (state == "game") {
    background(170, 230, 240);
    cloud();
    cloud4();
    text("Look, a butterfly! Fun", 650, 80);
    image(grass, 0, 350);
    image (butterfly, mouseX, mouseY, 100, 100);
     
    if (mouseX > 1270 || mouseY < 10 || mouseY > 710) {
      // mouseX > 1270 // on the right if it goes out of bound
      // mouseY < 10 // top if it goes out of bound
      // mouseY > 710 // bottom if it goes out of bound
      state = "game over";
      
    }
    
  } else if (state == "game over") {
    background(0);
    image(grass, 0, 350);
    text("oh no, game over....the butterfly went out of bound", 600, 100);
    text("click to try again!", 600, 160);
    
    
  }
  println(state); 
  
}

void mousePressed() {
  if (state == "pregame") {
    state = "game";
  } else if (state == "game over") {
    state = "pregame";
    
  }

  
}

void cloud() {
  
  int x = 75;
  int y = 75;
 
  
   for (x = 75; x <300; x+=50) {
      noStroke();
      fill(255);
      ellipse(x, y, 100, 100);
    }
  
}

void cloud2() {
  
  int x = 950;
  int y = 0;
  
  for (x = 1000; x <width; x+=60) {
      noStroke();
      fill(255);
      ellipse(x, y, 100, 100);
    }
}

void cloud3() {
  
  int x = 550;
  int y = 95;
  
  for (x = 550; x <800; x+=70) {
      noStroke();
      fill(255);
      ellipse(x, y, 100, 100);
    }
  
}

void cloud4() {
  int x = 1000;
  int y = 150;
  
  for (x = 1000; x <1200; x+=65) {
      noStroke();
      fill(255);
      ellipse(x, y, 100, 100);
    }
  
  
  
}
