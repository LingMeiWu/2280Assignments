//Welcome to the sunflower garden
// Click on each flower to read their lore
// There maybe a special cloud around that you can interact with
// If you wish to exit the garden, click on the door on the bottom right
// Enjoy walking through the garden!

String state = "pregame";

PImage grass;
PImage butterfly;
PImage sunflower;
PImage blackEyedSusan;
PImage bushDaisy;
PImage falseSunflower;
PImage gerberaDaisy;

int x2 = 1000;

String[] lore = {"This is a Sunflower","This is a Black-eyed Susan","This is a butterfly","This is a falseSunflower","This is a Bush Daisy", "This is a Gerbera Daisy","Hey, look, you caught the moving rainbow cloud!"};



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
    cloud2(x2);
    x2+=3;
    if (x2 >width+30) {
      x2 =-270;
    }
    cloud3();
    cloud4();
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
    cloud2(x2);
    x2+=3;
    if (x2 >width+30) {
      x2 =-270;
    }
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
    text(lore[0], 400, 100);
    textSize(24);
    text("Facts about sunflower:\nThey grow facing towards the sun\nand the sun always rise from the east\nso you'll never get lost if you managed\nto find a sunflower field facing east\nby the way, these are just silly facts the creator\njust came up with\nare they crediable? huh, you'll just have to find it\nout yourself.",400, 200);
    textSize(40);
  } else if (state == "blackEyedSusan") {
    background(202, 221, 226);
    image (blackEyedSusan, 60, 340, 350, 350);
    text(lore[1], 700, 100);
    textSize(24);
    text("Ah Black-eyed susan, they awfully look similar\nto a sunflower. And you may wonder why?\nwell, well, well, you have come to the wrong place\nto understand different typed of sunflower.\nGoogle may be the place you are looking for.",700,200);
    textSize(40);
    fill(255);
  } else if (state == "butterfly") {
    background(202, 221, 226);
    image(butterfly, 60, 340, 100, 100);
    fill(255);
    text(lore[2], 400, 100);
    textSize(24);
    text("Here is a butterfly\na specimen that is here\nto take all the wonderful nectar\nbet you didn't know about that!",400, 200);
    textSize(40);
  } else if (state == "falseSunflower") {
    background(202, 221, 226);
    image(falseSunflower, 450, 535, 100, 100);
    fill(255);
    text(lore[3], 400, 100);
    textSize(24);
    text("A false sunflower? what is that doing here?\nThere can only be one true sunflower in this field.\nThis is just an imitation sunflower\njust like imitation crab.",400,200);
    textSize(40);
  } else if (state == "bushDaisy") {
    background(202, 221, 226);
    image(bushDaisy, 480, 150, 450, 450);
     text(lore[4], 280, 400);
    textSize(24);
    text("Ah what a beautifu bush daisy.\nDid you know that there is abush cult out there\nwell, now you know. I hope this was helpful.",300,500);
    textSize(40);
    fill(255);
   
  } else if (state == "gerberaDaisy") {
    background(202, 221, 226);
    image(gerberaDaisy, 900, 540, 100, 100);
    fill(255);
    text(lore[5], 400, 200);
    textSize(24);
    text("Gerbera daisy, what a lovely flower\napparently it's pixie daisy so it's small\nit always wonder when\nit would grow taller\nlike the sunflower next to it.",400,300);
    textSize(40);
    image(sunflower, 970, 100, 350, 700);
  } else if (state == "cloud2") {
    background(202, 221, 226);
    cloud2(x2);
    x2+=3;
    if (x2 >width+30) {
      x2 =-270;
    }
    text(lore[6], 600, 300);
    textSize(24);
    text("The lore for this rainbow cloud\nthe creator wanted cotton candy",600,400);
    textSize(40);
  }
  
  
  // GAME OVER SECTION
  
  else if (state == "game over") {
    background(0, 24, 63);
    image(grass, 0, 350);
    textSize(40);
    textSize(30);
    fill(255);
    text("The end, hope you had some laughs and giggles visiting the garden~", 640, 100);
    text("Click again to go back to menu!", 600, 160);
    cloud2(x2);
    x2+=3;
    if (x2 >width+30) {
      x2 =-270;
    }
    textSize(40);
    image (blackEyedSusan, 60, 340, 350, 350);
    image(butterfly, 60, 340, 100, 100);
    image(grass, 0, 350);
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
    } else if (mouseX <= x2+210 && mouseX >=x2-30 && mouseY >=0 && mouseY <=30) {
      state = "cloud2";
    }
  } else if (state == "sunflower" || state == "blackEyedSusan" || state == "butterfly" || state == "falseSunflower" || state == "bushDaisy" || state == "gerberaDaisy" || state == "cloud2") {
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

void cloud2(int x) {
  int xPos = x;
  int y = 0;
   fill(random(128, 256), random(128, 256), random(128, 256));
  for (int i = 0; i < 4; i++) {
    noStroke();
    // fill(random(255), random(255), random(255));
    ellipse(xPos, y, 100, 100);
    xPos += 60;
      
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
