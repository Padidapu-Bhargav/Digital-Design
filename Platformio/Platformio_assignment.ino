#include <LiquidCrystal.h>
LiquidCrystal lcd(7, 8, 9, 10, 11, 12);


void setup() {
  lcd.begin(16, 2);
}

void loop() {

    double inputNumber = 32.87; 
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print("Decimal:");
    lcd.setCursor(8,1);
    lcd.print(inputNumber);
    delay(2000);
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print("Binary: ");
    int intPart = int(inputNumber);
    float fractionalPart = inputNumber - intPart;
    lcd.setCursor(7,1);
    printBinary(intPart,fractionalPart);
    delay(2000);
    lcd.clear();

}

void printBinary(int intPart,float fractionPart) {
  if (intPart == 0) 
  {
    lcd.print(0);
    return;
  }

  int binaryNum[32];
  int i = 0;
    while (intPart > 0)
    {
      binaryNum[i] = intPart % 2;
      intPart = intPart / 2;
      i++;
    }

  for (int j = i-1; j >= 0; j--)
    lcd.print(binaryNum[j]);
    lcd.print(".");
    
  for (int i = 0; i < 3; i++)
  {
    fractionPart *= 2;
    int data = int(fractionPart);
    lcd.print(data);
    fractionPart -= data;
  }
}
