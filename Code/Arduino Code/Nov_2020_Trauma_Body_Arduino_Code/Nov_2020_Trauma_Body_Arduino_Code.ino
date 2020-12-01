//#include <SoftwareSerial.h>


//SoftwareSerial mySerial(A0, A1);
;

char value2;

#include <Wire.h> 
#include <Servo.h>
char val; // Data received from the serial port
int value;
Servo shoulderBaseL;  // create servo object to control a servo
Servo shoulderJointL; //each servo is one side of the hand
Servo elbowJointL;
Servo elbowJointR;
Servo shoulderBaseR;  // create servo object to control a servo
Servo shoulderJointR;
Servo hipJoint1L; //each servo is one side of the hand
Servo hipJoint1R;


boolean approached = false; // approached boolean


void setup() 
{
 Serial.begin(9600); //has to match processing and monitor
  // attaches the servo on pin 3 to the servo object
   //mySerial.begin (9600);

//  
  
 hipJoint1L.attach(4);  
  hipJoint1R.attach(5);
  elbowJointR.attach(2);
  elbowJointL.attach(3);
  shoulderBaseR.attach(7);  
  shoulderJointR.attach(8);
  shoulderBaseL.attach(10);  
  shoulderJointL.attach(11);
  
  shoulderBaseL.write(0); 
  elbowJointL.write(0);
  elbowJointR.write(0);
  shoulderJointL.write(0);
  shoulderBaseR.write(180);  
  shoulderJointR.write(0);
  hipJoint1L.write(0);  
  hipJoint1R.write(0);
 
  
}


void loop() 
{
 if (Serial.available()) { // If data is available to read,
 val = Serial.read(); // read it and store it in val
  
 }
int val2 = map(val,0,180,180,0);
Serial.println(val2);
shoulderBaseL.write(val);
shoulderJointL.write(val);
shoulderBaseR.write(val2-20);
shoulderJointR.write(val);
hipJoint1L.write(val);
hipJoint1R.write(val);
elbowJointL.write(val);
elbowJointR.write(val);


}
