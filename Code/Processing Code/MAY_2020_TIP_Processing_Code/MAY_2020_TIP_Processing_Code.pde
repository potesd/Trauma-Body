import de.voidplus.leapmotion.*; // call leap motion
import processing.serial.*;  // Call Serial Communication


LeapMotion leap; // declare leap motion
   color c;
   
   Serial myPort;  // Create object from Serial class
   float val;        // Data received from the serial port
   
void setup()
{
  size(400,400);
  background(random(255),random(255),random(255));
  leap = new LeapMotion(this);
  //String portName = Serial.list()[0];
  myPort = new Serial(this, "COM3" , 9600);
}


void keyPressed() {
  if (key == 'c') {
    background(random(255), random(255), random(255));
  }

  if (key == 's') {
    saveFrame("FingerPainting_###.png");
  
         
    
  }
}
void draw()
{
      background(255, 255, 255);

  
  
  //  rectMode(CENTER);0
  //  strokeWeight(5);
  //  stroke(150,0,0);
  //  fill(#FF0000);
  //  rect(width/2, height/2, 100, 50);
  
  
  
  for(Hand hand: leap.getHands()){
    
    //initializes hand attributes for each hand seen by the leap object
    int hand_id = hand.getId();
    PVector hand_position = hand.getPosition();
    PVector hand_stabilized = hand.getStabilizedPosition();
    PVector hand_direction = hand.getDirection();
    PVector hand_dynamics = hand.getDynamics();
    float hand_roll = hand.getRoll();
    float hand_pitch = hand.getPitch();
    float hand_yaw = hand.getYaw();
    boolean hand_is_left = hand.isLeft();
    boolean hand_is_right = hand.isRight();
    float hand_grab = hand.getGrabStrength();
    float hand_pinch = hand.getPinchStrength();
    float hand_time = hand.getTimeVisible();
    PVector sphere_position = hand.getSpherePosition();
    float sphere_radius = hand.getSphereRadius();
    
    //initializes specific fingers for each hand seen
    Finger finger_thumb = hand.getThumb();
    Finger finger_index = hand.getIndexFinger();
    Finger finger_ring = hand.getRingFinger();
    Finger finger_pinky = hand.getPinkyFinger();
    Finger finger_middle = hand.getMiddleFinger();
    
    
    
    
    //Actions to be taken when hand is seen
    //hand.draw();
    //finger_index.draw();
    strokeWeight(1);
        //stroke(random(255),random(255),random(255));
        stroke(c-75);
        //fill(finger.getPosition().x,finger.getPosition().y,random(255));
        fill(c);
        //ellipse(finger.getPosition().x, finger.getPosition().y,50,50);
        String s = "DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   ";
       
        text(s,hand.getPosition().x, hand.getPosition().y,hand.getTimeVisible()*9,hand.getTimeVisible()*9);
        //ellipse(finger.getPosition().x, finger.getPosition().y,finger.getTimeVisible()*2,finger.getTimeVisible()*2);
        val = hand.getPosition().y;
        val = map(val, 0,2000,0,180);
        val = map(val, 30,90,0,70);
        float handvalue = abs(val);
        float value = abs(handvalue);
        println(value);
        if (handvalue != 0 && handvalue <= 70){
        myPort.write((byte)(handvalue));
        }
 
    
    
    
    
    
    
    for(Finger finger : hand.getFingers())
    {
      
      //initialize finger attributes for each finger for each hand
      int finger_id  = finger.getId();
      PVector finger_position = finger.getPosition();
      PVector finger_stabilized = finger.getStabilizedPosition();
      PVector finger_velocity = finger.getVelocity();
      PVector finger_direction = finger.getDirection();
      float finger_time = finger.getTimeVisible();
      
      
      
      //code for each specific finger's actions
      switch(finger.getType())
      {
        
        
        case 0: //thumb
          break;
        case 1: //index
        //strokeWeight(1);
        ////stroke(random(255),random(255),random(255));
        //stroke(c-75);
        ////fill(finger.getPosition().x,finger.getPosition().y,random(255));
        //fill(c);
        ////ellipse(finger.getPosition().x, finger.getPosition().y,50,50);
        //String s = "DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   DON'T TOUCH ME   ";
       
        //text(s,finger.getPosition().x, finger.getPosition().y,finger.getTimeVisible()*9,finger.getTimeVisible()*9);
        ////ellipse(finger.getPosition().x, finger.getPosition().y,finger.getTimeVisible()*2,finger.getTimeVisible()*2);
        //val = finger.getPosition().y;
        //val = map(val, 0,2000,0,180);
        //val = map(val, 30,90,0,70);
        //float handvalue = abs(val);
        //println(handvalue);
        //if (handvalue != 0 && handvalue <= 70){
        //myPort.write((byte)(handvalue));
        //}
          break;
        case 2: //middle
          break;
        case 3: //ring
          break;
        case 4: //pinky
          break;
          
          
      }
       if (key == '1') {
      c = color(#E80000);
    }
    if (key == '2') {
      c = color(#F507F1);
    }
    if (key == '4') {
      c = color(#07F5F3);
    }
    if (key == '3') {
      c = color(#F59607);
    }
    if (key == '5') {
      c = color(#BA80D3);
    }
    if (key == '6') {
      c = color(#887CFF);
    }
    if (key == '7') {
      c = color(#7CFF95);
    }
    if (key == '8') {
      c = color(#CDFAA4);
    }
    if (key == '9') {
      c = color(random(255),random(255),random(255));
    }
      
      //touch emulation - actions for fingers in specific zones
      int touch_zone = finger.getTouchZone();
      float touch_distance = finger.getTouchDistance();
      
      switch(touch_zone)
      {
        case -1: //none
        break;
        case 0: //hovering
        println("hovering (#" + finger_id + "): " + touch_distance);
        break;
        case 1: //touching
        println("touching (#" + finger_id + "): " + touch_distance);
        break;
      }    
      
    }
    
  }
   
}
