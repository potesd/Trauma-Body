#include <SoftwareSerial.h>
SoftwareSerial Thermal(2, 3);

char value2;

#include <Wire.h> 
#include <Servo.h>
char val; // Data received from the serial port
int trigPin = 11;    // Trigger
int echoPin = 12;    // Echo
long duration, cm, inches;
 int value;
 Servo handservo;  // create servo object to control a servo
Servo elbowservo1; //each servo is one side of the hand
Servo elbowservo2;

boolean approached = false; // approached boolean


void setup() 
{
 Serial.begin(9600); //has to match processing and monitor
  // attaches the servo on pin 3 to the servo object
  handservo.attach(4);  // attaches the servo on Digital pin 3 to the servo object
  elbowservo1.attach(5);  // attaches the servo on pin 3 to the servo object
  elbowservo2.attach(6);
  
}


void loop() 
{
 while (Serial.available()) { // If data is available to read,
 val = Serial.read(); // read it and store it in val
 int val2 = map(val,0,90,90,0);
 handservo.write(val);
 elbowservo1.write(val);
 elbowservo2.write(val2);
 }



}




 
 

 



  
