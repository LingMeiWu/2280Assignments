int LED = 13;
int buttonPin = 2;

int buttonState = 0;

void setup () {
  
  pinMode(LED, OUTPUT);
  pinMode(buttonPin, INPUT);
  
}

void loop () {
  buttonState = digitalRead(buttonPin);
  delay(10);

  if (buttonState == HIGH) {
    LED = 13;
    digitalWrite(LED, HIGH);
    delay(1000);
    digitalWrite(LED, LOW);
    LED = LED -1;
    digitalWrite(LED, HIGH);
    delay(1000);
    digitalWrite(LED, LOW);
    LED = LED -1;
    digitalWrite(LED, HIGH);
    delay(1000);
    digitalWrite(LED, LOW);
    LED = LED -1;
    digitalWrite(LED, HIGH);
    delay(1000);
    digitalWrite(LED, LOW);
    LED = LED -1;
    digitalWrite(LED, HIGH);
    delay(1000);
    digitalWrite(LED, LOW);
    LED = LED -1;
    digitalWrite(LED, HIGH);
    delay(1000);
    digitalWrite(LED, LOW);
  }
  else {
    digitalWrite(LED, LOW);
   
  }
  
}
