/*----------------------------------------------------------------------*
 * Sketch to demonstrate reading two MAX6675s using the Thermocouple.h  *
 * library.  Note that the readF() and readC() functions return a       *
 * six-point moving average.  This works well to smooth out short-term  *
 * variations.  Here we are calling the read function every 10 seconds, *
 * but the MAX6675 conversion time should not exceed 0.22 seconds, so   *
 * the read function could be called up to about four times per second. *
 *									*
 * Jack Christensen 20Jul2011						*
 * j.christensen@sbcglobal.net                                          *
 *									*
 * This work is licensed under the Creative Commons Attribution-        *
 * ShareAlike 3.0 Unported License. To view a copy of this license,     *
 * visit http://creativecommons.org/licenses/by-sa/3.0/ or send a       *
 * letter to Creative Commons, 171 Second Street, Suite 300,            *
 * San Francisco, California, 94105, USA.                               *
 *----------------------------------------------------------------------*/

#include <SPI.h>                //http://arduino.cc/en/Reference/SPI
#include <Thermocouple.h>       //http://github.com/JChristensen/Thermocouple

//MAX6675 SPI pin definitions
#define csTC1  9                //chip select for MAX6675 #1
#define csTC2 10                //chip select for MAX6675 #2

//Additionally, connect the MAX6675s as follows:
//MISO  Arduino pin 12          //master in slave out
//SCK   Arduino pin 13          //serial clock

Thermocouple tc1 = Thermocouple(csTC1);    //instantiate the thermocouple objects
Thermocouple tc2 = Thermocouple(csTC2);

void setup() {
    Serial.begin(115200);       //initialize Serial
}

void loop() {
    Serial.print("tc1: ");
    displayTemp(tc1.readF());   //read the 1st TC and print the temperature
    Serial.print("tc2: ");
    displayTemp(tc2.readF());   //read the 2nd TC and print the temperature
    Serial.println();
    delay(10000);
}

void displayTemp(float fTemp) {
    if (fTemp < 0.0) {
        Serial.println("Open thermocouple circuit");
    }
    else {
        Serial.print(fTemp, 0);
        Serial.println("\260F");    //octal 260 = degree symbol
    }
}

