import processing.serial.*;

Serial myPort;

boolean firstContact = false;
int state = 0;
int val = 0;

boolean goodTemp = false;
boolean goodHumid = false;
boolean goodLight = false;

float[] xPos = {159, 359, 359, 909, 1109, 1109};
float[] yPos = {150, 50, 220, 150, 50, 220};
float[] maxY = {155, 55, 225, 155, 55, 225 };
float[] minY = {150, 50, 220, 150, 50, 220};

float lastTemp = 0;
float lastHumid = 0;
int lastLight = 0;


void setup() {
  size(1280, 720);

  printArray(Serial.list());
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);

}

void draw() {
  background(105, 105, 105);
  
  if (myPort.available() > 0) {
    myPort.write(0);
    if (state > 2) {
      state = 0;
    }
    if (state == 0) {
      fill(255, 255, 255);
      rect(50, 50, 1180, 50, 7);
      rect(50, 50, 50, 620, 7);
      rect(1180, 50, 50, 620, 7);
      rect(50, 620, 1180, 50, 7);
      
      // Window
      fill(176, 245, 255);
      rect(140, 140, 150, 150);
      rect(300, 140, 150, 150);
      rect(140, 300, 150, 150);
      rect(300, 300, 150, 150);
      
      // big pot plant
      fill(197, 109, 36);
      rect(215, 465, 160, 155, 60);
      fill(3, 161, 37);
      rect(280, 360, 30, 105);
      rect(230, 345, 50, 45);
      rect(310, 345, 50, 45);
      
      // small pot plant
      fill(159, 244, 92);
      rect(580, 150, 15, 200);
      rect(615, 120, 15, 200);
      rect(650, 135, 15, 200);
      fill(197, 109, 36);
      rect(550, 300, 150, 100, 70);
      
      // compuuter
      fill(0);
      rect(830, 220, 200, 135);
      rect(920, 220, 20, 180);
      rect(820, 390, 220, 10);
      fill(255);
      rect(840, 230, 180, 115);
      fill(0);
      rect(1070, 380, 25, 20, 30);
      
      
      // brown table
      fill(186, 115, 56);
      rect(500, 400, 50, 200);
      rect(1100, 400, 50, 200);
      rect(500, 400, 650, 75);
      // Box "click to play"
      
      fill(253, 224, 200);
      rect(575, 490, 500, 100);
      fill(186, 115, 56);
      PFont Font1 = createFont("Lucida Sans Typewriter Bold", 22);
      textFont(Font1);
      text("Click to test your room condition!", 600, 545 );
    } else if (state == 1) {

      float t = myPort.read();
      float h = myPort.read();
      int L = myPort.read();
      
      if (t < 0) {
        t = lastTemp;
      }
      if (h < 0) {
        h = lastHumid;
      }
      if (L < 0) {
        L = lastLight;
      }
      if (t > 70) {
        goodTemp = true;
      } else {
        goodTemp = false;
      }
      if (h > 60) {
        goodHumid = true;
      } else {
        goodHumid = false;
      }
      lastTemp = t;
      lastHumid = h;
      lastLight = L;
      
      // brown table
      fill(186, 115, 56);
      rect(0, 620, 1280, 100);

      
      // plant stem
      fill(3, 161, 37);
      rect(219, 30, 100, 400);
      
      //leaves
      leaves(0);
      leaves(1);
      leaves(2);
      
      // terra pot
      fill(244, 162, 94);
      rect(100, 290, 350, 330, 60);
      
      fill(253, 232, 168);
      rect(520,30, 620,275);
      rect(800, 400, 440, 200);
      
      fill(186, 115, 56);
      textSize(50);
      PFont Font1 = createFont("Lucida Sans Typewriter Bold", 50);
      textFont(Font1);
      text("Temperature: " + t, 540, 90 );
      text("Humidity: " + h, 540, 170);
      val = int( map(L, 0, 255, 0, 1023));
      text("Light: "+ val, 540, 250 );
      
      textSize(24);
      text("Please give it a few \nseconds to load", 820, 440);
      text("Once it settles, \nclick to go to the next page", 820, 530);
      
      
      if (val > 600) {
        goodLight = true;
      } else {
        goodLight = false;
      }

      delay(2000);
    } else if (state == 2) {
      
      // brown table
      fill(186, 115, 56);
      rect(0, 620, 1280, 100);
      
      // plant stem
      fill(3, 161, 37);
      rect(969, 30, 100, 400);
      
      //leaves
      leaves(3);
      leaves(4);
      leaves(5);
      
      // terra pot
      fill(244, 162, 94);
      rect(850, 290, 350, 330, 60);
      
      fill(253, 232, 168);
      rect(100, 50, 700, 560);
      
       fill(186, 115, 56);
      PFont Font1 = createFont("Lucida Sans Typewriter Bold", 24);
      textFont(Font1);
      if(goodTemp) {
        text("Temperature: " +"Excellent! Your room temperature \nis great for plants to thrive in!", 120, 110);
      } else {
        text("Temperature: " +"Your room might be too cold for \nyour plants...", 120, 110);
        text("Tips: Try moving your plants to a warmer spot \nif possible.", 120, 190);
      }
      if(goodHumid) {
        text("Humidity: " +"Wow, your room has good humidity for \ntheir leaves to not get dry easily.", 120, 280);
      } else {
        text("Humidity: " +"Dang, your room might be a little \ntoo dry for your plants..", 120, 280);
        text("   Tips: Try misting your plant in the morning \nso leaves won't get burned.", 120, 370);
      }
      if(goodLight) {
        text("Light: " +"Nice! Your room has abundant of food \nfor your plants!", 120,460);
      } else {
        text("Light: " +"Hmm, your room might be on the dark \nside for your plants..", 120, 460);
        text("  Tips: Try moving your plant near a window \nor a source of UV light.", 120, 550);
      }
      fill(253, 232, 168);
      textSize(18);
      text("Click to go back to home screen",900, 700 );
    }
    
  }



  myPort.write(state);
}

void mousePressed() {
  state++;
  println(state);
}

void leaves (int leafNum) {
  float speed = 3;
  fill(2, 225, 50);
  ellipse(xPos[leafNum], yPos[leafNum], 120, 60);
   yPos[leafNum] = yPos[leafNum] + speed;
   
   
  if (yPos[leafNum] >= maxY[leafNum]) {
    yPos[leafNum] = xPos[leafNum] + speed;
    yPos[leafNum] = minY[leafNum];
  }
}
