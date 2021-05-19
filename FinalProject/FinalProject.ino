/*By using the LCD1602 screen, DHT11 temperature and module, 
 * Potentiometer 10k, button, Photoresistor (aka photocell) - 
 * I want to know if the environment is good enough for 
 * my plant living condition.
 */
#include <LiquidCrystal.h> // The LCD screen library setup
#include <DHT.h>  // The temperature & humidity module

#define DHTPIN 10 
#define photocellPin A1
int photocellReading;


// Letting the library know how many pins are connected
LiquidCrystal lcd (13, 12, 7, 6, 5, 4 );
#define DHTTYPE DHT11 
DHT dht (DHTPIN, DHTTYPE);

void setup() {
  // setting up the LCD screen number of columns(16) and rows(2)
  lcd.begin(16, 2);
  dht.begin();
  Serial.begin(9600);
  while(!Serial) {
    ;
  }
  establishContact();
}

void loop() {

  delay(1000);
  lcd.setCursor(0, 0);
  lcd.print("Temp:   Humid: ");
  // column 0, line 1 = line 1 is second row, counting begins at 0
 lcd.setCursor(0, 1);
 // reading the humidity
 float h = dht.readHumidity();
  //read temperature in Fahrenheit
  float f = dht.readTemperature(true);

  if (isnan(h) || isnan(f)) {
    lcd.print("ERROR");
    return;
  }

  lcd.print(f);
  lcd.setCursor(8,1);
  lcd.print(h);  
  
 
  delay(1000);
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Light:  ");

  lcd.setCursor(8,0);
  photocellReading = analogRead(photocellPin);
  // photocellReading = photocellReading/4;
  lcd.print(photocellReading);

  Serial.write((byte)f);
  delay(100);
  Serial.write((byte)h);
  delay(100);
  Serial.write(photocellReading);
}

void establishContact() {
  while(Serial.available() <=0) {
    Serial.print('A');
    delay(300);
  }
}
