/*Begining of Auto generated code by Atmel studio */
#include <Arduino.h>

/*End of auto generated code by Atmel studio */


//Beginning of Auto generated function prototypes by Atmel Studio
void setup();
void loop();
//End of Auto generated function prototypes by Atmel Studio
void setup() {
  Serial.begin(9600);
  //Serial1.begin(9600);
}

void loop() {
  if(Serial.available())
  {
    bool ramka_GPGGA=true;
    if(Serial.read()!='$')ramka_GPGGA=false;
    if(Serial.read()!='G')ramka_GPGGA=false;
    if(Serial.read()!='P')ramka_GPGGA=false;
    if(Serial.read()!='G')ramka_GPGGA=false;
    if(Serial.read()!='G')ramka_GPGGA=false;
    if(Serial.read()!='A')ramka_GPGGA=false;
    if(ramka_GPGGA)
    {
      bool nkoniec=true;
      for(byte l = 0; nkoniec==true; l++)
      {
        String text=Serial.readStringUntil(',');
        Serial.print(String(" ")+l+": ");
        Serial.print(text);
        String tk="*";
        nkoniec=text.substring(0,1)!=tk;
      }
      Serial.println("");
    }
  }
}
