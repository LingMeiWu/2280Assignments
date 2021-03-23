// Experimenting with game states: pregame, game, game over
// 1. start in pregame
// 2. click the mouse to start the game
// 3. when game is over transition to game over
// 4. click to transition to pregame

String state = "pregame";

PImage grass;
PImage butterfly;
PImage sunflower;
PImage blackEyedSusan;
PImage bushDaisy;
PImage falseSunflower;
PImage gerberaDaisy;


void setup() {
  size(1280, 720);
  textAlign(CENTER);
  textSize(40);

  background(255);
  grass = loadImage("grass.png");
  butterfly = loadImage("butterfly.png"); 
  sunflower = loadImage("TransparentSunflower.png");
  blackEyedSusan = loadImage("TransparentBlackEyedSusan.png");
  bushDaisy = loadImage("TransparentBushDaisy.png");
  falseSunflower = loadImage("TransparentFalseSunflower.png");
  gerberaDaisy = loadImage("TransparentGerberaDaisy.png");
}

void draw() {


  if (state == "pregame") {

    background (240, 200, 100);
    noStroke();
    cloud();
    cloud2();
    cloud3();
    image(butterfly, 60, 340, 100, 100);
    image(sunflower, 970, 250, 350, 350);
    image(grass, 0, 350);

    // outer white box
    fill(240);
    rect(375, 220, 600, 200);

    // inner yellow box
    fill(240, 200, 100);
    rect(385, 240, 575, 150);

    fill(255);
    text("Click to start the game", width/2+30, height/2-30 );
  } else if (state == "game") {
    background(170, 230, 240);
    cloud();
    cloud2();
    cloud3();
    cloud4();
    image (blackEyedSusan, 60, 340, 350, 350);
    image(butterfly, 60, 340, 100, 100);
    image(sunflower, 970, 250, 350, 350);
    image(bushDaisy, 480, 150, 450, 450);
    image(falseSunflower, 450, 535, 100, 100);
    image(gerberaDaisy, 900, 540, 100, 100);
    image(grass, 0, 350);
    door();
  } else if (state == "sunflower") {
    background(202, 221, 226);
    image(sunflower, 970, 250, 350, 350);
    fill(255);
    text("This is a Sunflower", 300, 100);
  } else if (state == "blackEyedSusan") {
    background(202, 221, 226);
    image (blackEyedSusan, 60, 340, 350, 350);
    text("This is a Black-eyed Susan", 300, 100);
    fill(255);
  } else if (state == "butterfly") {
    background(202, 221, 226);
    image(butterfly, 60, 340, 100, 100);
    fill(255);
    text("This is a butterfly", 300, 100);
  } else if (state == "falseSunflower") {
    background(202, 221, 226);
    image(falseSunflower, 450, 535, 100, 100);
    fill(255);
    text("This is a falseSunflower", 300, 100);
  } else if (state == "bushDaisy") {
    background(202, 221, 226);
    image(bushDaisy, 480, 150, 450, 450);
    fill(255);
    text("This is a Bush Daisy", 300, 100);
  } else if (state == "gerberaDaisy") {
    background(202, 221, 226);
    image(gerberaDaisy, 900, 540, 100, 100);
    fill(255);
    text("This is a Gerbera Daisy", 300, 100);
  } // GAME OVER SECTION
  
  else if (state == "game over") {
    background(36, 104, 165);
    image(grass, 0, 350);
    textSize(40);
    textSize(30);
    text("Good work, your knowledge of sunflower & daisies has been expanded!", 600, 100);
    text("Click again to go back to menu!", 600, 160);
    textSize(40);
  }
  println(state);
} 


void mousePressed() {
  if (state == "pregame") {
    state = "game";
  } else if (state == "game over") {
    state = "pregame";
  } else if (state == "game") {
    if (mouseX <= 1280 && mouseX >=1240 && mouseY >=650 && mouseY <=720) {
      state = "game over";
    } else if (mouseX <= 1280 && mouseX >=1000 && mouseY >=300 && mouseY <=700) {
      state = "sunflower";
    } else if (mouseX <= 160 && mouseX >=75 && mouseY >=360 && mouseY <=440) { 
      state = "butterfly";
    } else if (mouseX <= 375 && mouseX >=100 && mouseY >=360 && mouseY <=700) {
      state = "blackEyedSusan";
    } else if (mouseX <= 550 && mouseX >=450 && mouseY >=525 && mouseY <=650) {
      state = "falseSunflower";
    } else if (mouseX <= 900 && mouseX >=530 && mouseY >=200 && mouseY <=530) {
      state = "bushDaisy";
    } else if (mouseX <= 1000 && mouseX >=920 && mouseY >=525 && mouseY <=650) {
      state = "gerberaDaisy";
    }
  } else if (state == "sunflower" || state == "blackEyedSusan" || state == "butterfly" || state == "falseSunflower" || state == "bushDaisy" || state == "gerberaDaisy") {
    state = "game";
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

void door() {
  fill(221, 161, 94);
  rect(1240, 650, 50, 75); 
  noFill();
  fill(141, 97, 47);
  rect(1245, 655, 30, 30);
  noFill();
  fill(141, 97, 47);
  rect(1245, 690, 30, 30);
  noFill();
  fill(243, 244, 68);
  ellipse(1270, 687, 15, 15);
  noFill();
}
