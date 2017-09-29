/* 
    Testing MQ-8 GAS sensor with serial monitor
    Suitable for detecting Hydrogen or Methane
    Dev: Michalis Vasilakis // Date: 11/6/2015 // www.ardumotive.com
*/

const long loopInterval = 4000;  // ms

// gas sensor
const int mq8 = A0;         //GAS sensor output pin to Arduino analog A0 pin

// print output decoration
const String plusminus = "+-";
bool pmState = true;

// pump control
const int pump = PD3;       //pump control
const int pumpON = HIGH;
const int pumpOFF = LOW;
bool pumpState = false;     // false == OFF, true == ON
const long pumpTimerCount = 60000; // one minute
long pumpTimer = pumpTimerCount;

void setup()
{
    Serial.begin(9600); //Initialize serial port - 9600 bps
    pinMode(pump, OUTPUT);
    digitalWrite(pump, pumpOFF);
}

void loop()
{
    String line;
    line += String("MQ") + plusminus[pmState ? 0 : 1] + String("8: ") + String(analogRead(mq8));
    pmState = !pmState;


    pumpTimer = pumpTimer - loopInterval;
    //line = line + String("   ") + String(pumpTimer);
    Serial.println(line);
    if (pumpTimer <= 0)
    {
        pumpTimer = pumpTimerCount;
        digitalWrite(pump, pumpState ? pumpOFF : pumpON);
        pumpState = !pumpState;
    }
    delay(loopInterval); // loop once every ~loopInterval ms
}


