MAX7765 Thermocouple Library for Arduino
========================================

This is a library to interface K-type thermocouples to Arduino using the MAX6675 Cold-Junction-Compensated K-Thermocouple-to-Digital Converter from Maxim Integrated Products.

There are only a few things that you need to know in order to use this library.

1. The MAX6675 is an SPI device, and this library uses the standard SPI interface, so you must #include <SPI.h> at the top of your sketch.

2. One or more MAX6675s can be bussed together to interface multiple thermocouples.  This library makes it easy to instantiate as many thermocouple objects as you need.  Connect all the MAX6675 Serial Out (SO) pins together, and connect them to Arduino pin 12 (MISO).  Connect all the MAX6675 Serial Clock (SCK) pins together, and connect them to Arduino pin 13.  The Chip Select (CS) pin from each MAX6675 must go to its own Arduino pin; any pin can be used.

(If you use Adafruit Industries' MAX6675 Thermocouple Amplifier Breakout Board like I do, the Serial Out pin is labeled DO (Data Out) and the Serial Clock pin is labeled CLK (Clock).  See http://www.adafruit.com/products/269.)

3. To instantiate a thermocouple object, pass the Arduino pin number where the MAX6675 chip select is connected to the constructor:
	#define csTC1  10                          //chip select for MAX6675
	Thermocouple tc1 = Thermocouple(csTC1);    //instantiate the thermocouple object

4. To read the thermocouple, call either the readC() or the readF() method, these both return the temperature as a FLOAT value.  The MAX6675 will detect if the thermocouple circuit is open (i.e. not connected).  In this case, readC() or readF() will return a negative number.  This does not cause confusion with actual temperature readings since the MAX6675 only reads down to 0°C (32°F).  For example,
	float myTemp;
	myTemp = tc1.readC();
	
5. The temperature returned by either readC() or by readF() is a moving average of the last six consecutive readings.  This technique is useful to smooth out short-term variations in the readings.  	The assumption is that the read function will be called on a more-or-less regular basis.  Do not call readC() or readF() more than about four times per second, as the MAX6675 has a 220 millisecond conversion time.
	
See the complete examples included with the library.
See the datasheet for a complete description of the MAX6675:
http://datasheets.maxim-ic.com/en/ds/MAX6675.pdf

Jack Christensen
V1.0 21Jul2011

This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License. To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/ or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.