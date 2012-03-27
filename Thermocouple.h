/*----------------------------------------------------------------------*
 * Thermocouple.h -- Library for reading thermocouple temperature       *
 * via a MAX6675.                                                       *
 *                                                                      *
 * Jack Christensen 16Feb2011                                           *
 *                                                                      *
 * This work is licensed under the Creative Commons Attribution-        *
 * ShareAlike 3.0 Unported License. To view a copy of this license,     *
 * visit http://creativecommons.org/licenses/by-sa/3.0/ or send a       *
 * letter to Creative Commons, 171 Second Street, Suite 300,            *
 * San Francisco, California, 94105, USA.                               *
 *----------------------------------------------------------------------*/
#ifndef Thermocouple_h
#define Thermocouple_h
#if ARDUINO >= 100
#include <Arduino.h> 
#else
#include <WProgram.h> 
#endif
class Thermocouple
{
    public:
        Thermocouple(int ssPin);
        float readC();
        float readF();
    private:
        int _ssPin;
        float _temps[6];
        boolean _first;
};
#endif