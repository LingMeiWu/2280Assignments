int LED = 11;
int LEDState = 0;
int buttonPin = 2;
int buttonState = 0;
int lastButtonState = LOW;

void setup () {
  pinMode(LED, OUTPUT);
  pinMode(buttonPin, INPUT);

}

void loop () {

  if (LEDState == 0) {

    LED = 11;
    analogWrite(LED, 255);
    delay(100);
    if (button()) {
      return;
    }
    analogWrite(LED, 0);
    LED = 10;
    analogWrite(LED, 255);
    delay(100);
    if (button()) {
      return;
    }
    analogWrite(LED, 0);
    LED = 9;
    analogWrite(LED, 255);
    delay(100);
    if (button()) {
      return;
    }
    analogWrite(LED, 0);
    LED = 6;
    analogWrite(LED, 255);
    delay(100);
    if (button()) {
      return;
    }
    analogWrite(LED, 0);
    LED = 5;
    analogWrite(LED, 255);
    delay(100);
    if (button()) {
      return;
    }
    analogWrite(LED, 0);
    LED = 3;
    analogWrite(LED, 255);
    delay(100);
    if (button()) {
      return;
    }
    analogWrite(LED, 0);


  }

  else if (LEDState == 1) {
    analogWrite(10, 0);
    analogWrite(9, 0);
    analogWrite(5, 0);
    analogWrite(3, 0);
    //red
    LED = 11;
    analogWrite(LED, 255);
    LED = 6;  //red
    analogWrite(LED, 255);
    delay(100);
    if (button()) {
      return;
    }
    LED = 11;
    analogWrite(LED, 0);
    LED = 6;
    analogWrite(LED, 0);
    delay(100);
    if (button()) {
      return;
    }
  }

  else if (LEDState == 2) { //green
    analogWrite(11, 0);
    analogWrite(9, 0);
    analogWrite(6, 0);
    analogWrite(3, 0);
    //red
    LED = 10;
    analogWrite(LED, 255);
    LED = 5;  //red
    analogWrite(LED, 255);
    delay(100);
    if (button()) {
      return;
    }
    LED = 10;
    analogWrite(LED, 0);
    LED = 5;
    analogWrite(LED, 0);
    delay(100);
    if (button()) {
      return;
    }
  }

  else if (LEDState == 3) { //blue
    analogWrite(11, 0);
    analogWrite(10, 0);
    analogWrite(6, 0);
    analogWrite(5, 0);
    //red
    LED = 9;
    analogWrite(LED, 255);
    LED = 3;  //red
    analogWrite(LED, 255);
    delay(100);
    if (button()) {
      return;
    }
    LED = 9;
    analogWrite(LED, 0);
    LED = 3;
    analogWrite(LED, 0);
    delay(100);
    if (button()) {
      return;
    }
  }

}

bool button() {
  buttonState = digitalRead(buttonPin);
  delay(10);

  if (buttonState == HIGH && lastButtonState == LOW) {
    LEDState++;
    if (LEDState == 4) {
      LEDState = 0;
    }
    lastButtonState = buttonState;
    return true;
  }
  lastButtonState = buttonState;
  return false;
}
