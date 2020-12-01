import processing.sound.*;//import sound library
import de.voidplus.leapmotion.*; // call leap motion
import processing.serial.*;  // Call Serial Communication

LeapMotion leap; // declare leap motion
color c;
   
   
//declare info recieved fro port   
Serial myPort;  // Create object from Serial class
float val;        // Data received from the serial port
float handvalue;

//declare isplaying booleans
boolean playing = false; // sets a boolean to be checked against isPlaying()
boolean peoplePlaying = false; // sets booleans for each sound to have been interacted with
boolean level1played = false;//these booleans make it so that I can have a log of what interactions have been triggered and then not trigger twice in a row.
boolean level2played = false; // the code checks to see which boolean has been triggered before each reaction. it won't make the same reaction twice except for the touch based one. 
boolean level3played = false;
boolean level4played = false;
boolean people1played = false;
boolean people2played = false;
boolean people3played = false;
boolean triggeredplayed = false;

float levels = 0;//creates the float for levels which is then converted to trigger
float touchlevel = 18;

//declare sound files
SoundFile person1;//instantiate the soundfiles
SoundFile level2;
SoundFile level3;
SoundFile people3;
SoundFile level4;
SoundFile people5;
SoundFile people5level4;
SoundFile touch;
int amountOfPeople = 0;

//declare audio ints
Amplitude amp;
AudioIn in;
float smoothingFactor = 0.25;
float sum;
int ampsize;
   
void setup()
{
  size(400,400);
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  
  person1 = new SoundFile(this, "person1.aiff"); // name and declare the files associated with each sound
  level2 = new SoundFile(this, "level2.aiff");
  level3 = new SoundFile(this, "level3.aiff");
  level4 = new SoundFile(this, "level4.aiff");
 people5 = new SoundFile(this, "people5.aiff");
 people3 = new SoundFile(this, "people3.aiff");
  people5level4 = new SoundFile(this, "people5level4.aiff");
  touch = new SoundFile(this, "touch.aiff");
  
  background(random(255),random(255),random(255));
  leap = new LeapMotion(this);
  //String portName = Serial.list()[0];
```
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
 sum += (amp.analyze() - sum) * smoothingFactor;
 playing = touch.isPlaying() || person1.isPlaying() || level2.isPlaying() || level3.isPlaying() || level4.isPlaying() ||people5.isPlaying()|| people3.isPlaying() || people5level4.isPlaying() ; // this bit of code sets the boolean playing to match the isPlaying() boolean associated with each level. 
 float amp_scaled = sum * (height/2) * 5; 
 ampsize = Math.round(amp_scaled); 
 float ampsizemapped = map(ampsize,0,350,0,20);
 ampsizemapped = Math.round(ampsizemapped); //ampsizemapped is the float to be used for tracking audio levels
   //println(ampsizemapped);
  //  rectMode(CENTER);0
  //  strokeWeight(5);
  //  stroke(150,0,0);
  //  fill(#FF0000);
  //  rect(width/2, height/2, 100, 50);
  
  
   //Audio Reaction Code
   
  // if (ampsizemapped == 10 && handvalue <= 15) { //if the trigger is = to max volume
  //  if (!triggeredplayed ) { // and the playing boolean is NOT true
  //   level3.stop();
  //   level2.stop();
  //   level4.stop();
  //  person1.stop();
  //  people3.stop();
  //  people5.stop();
  //  people5level4.stop();
  //    touch.play(); // then play level 4
  //      level1played = false;
  //    level2played = false;
  //    level3played = false;
  //    level4played = false;
  //    people1played = false;
  //    people2played = false;
  //    people3played = false;
  //    triggeredplayed = true;
  //  }
  //} 
   
  
  //level 4 is triggered
  if (ampsizemapped == 18 && handvalue <= 15) { //if the trigger is = to max volume
    if (!level4played) { // and the playing boolean is NOT true
     level3.stop();
     level2.stop();
    person1.stop();
    people3.stop();
    people5.stop();
    people5level4.stop();
    
      level4.play(); // then play level 4
        level1played = false;
      level2played = false;
      level3played = false;
      level4played = true;
      people1played = false;
      people2played = false;
      people3played = false;
      triggeredplayed = false;
    }
  } 

  //level 3 is triggered
  if (ampsizemapped == 10 && handvalue >= 50) {//if the trigger is = to max volume
    if (!playing&&!level3played) {// and the playing boolean is NOT true
    level2.stop();
    person1.stop();
      level3.play();// then play level 4
        level1played = false;
      level2played = false;
      level3played = true;
      level4played = false;
      people1played = false;
      people2played = false;
      people3played = false;
      triggeredplayed = false;
    }
  } 

  //level2 is triggered
  if (ampsizemapped == 12 && handvalue >= 50) {//if the trigger is = to max volume
    if (!playing&&!level2played) {// and the playing boolean is NOT true
    person1.stop();
      level2.play();// then play level 4
        level1played = false;
      level2played = true;
      level3played = false;
      level4played = false;
      people1played = false;
      people2played = false;
      people3played = false;
      triggeredplayed = false;
    }
  }  

  //level is triggered
  if (ampsizemapped == 8 && handvalue >= 50) {  //checks to see that trigger = 20
    if (!playing&&!level1played) {// and the playing boolean is NOT true
      person1.play(); // plays level if the conditions are met
      level1played = true;
      level2played = false;
      level3played = false;
      level4played = false;
      people1played = false;
      people2played = false;
      people3played = false;
      triggeredplayed = false;
    }
  }
  
  if ( ampsizemapped == 12 && handvalue <= 25  ){
    if (!playing&&!people1played) {
    background( 0 );
    textAlign( CENTER );
    level3.stop();
     level2.stop();
     level4.stop();
    person1.stop();
   people3.play(); // replace with please don't crowd me
     level1played = false;
      level2played = false;
      level3played = false;
      level4played = false;
      people1played = true;
      people2played = false;
      people3played = false;
      triggeredplayed = false;
    }
  }
  
  
  if ( ampsizemapped == 20 && handvalue <= 1 ){
    if (!playing&&!people2played) {
    background( 0 );
    textAlign( CENTER );
    
    person1.stop();
    people3.stop();
  
  
      
    people5.play(); // replace with please leave me alone
      level1played = false;
      level2played = false;
      level3played = false;
      level4played = false;
      people1played = false;
      people2played = true;
      people3played = false;
      triggeredplayed = false;
    }
  }
  //trigger if more than 5 people and lots of volume
  if (ampsizemapped == 18 && handvalue <= 20 ) { //if the trigger is = to max volume
    if (!playing&&!people3played) { // and the playing boolean is NOT true
    level3.stop();
     level2.stop();
     level4.stop();
    person1.stop();
    people3.stop();
    people5.stop();
   touch.stop();
      
      people5level4.play(); // then play level 4
        level1played = false;
      level2played = false;
      level3played = false;
      level4played = false;
      people1played = false;
      people2played = false;
      people3played = true;
      triggeredplayed = false;
    }
  }
   
   //audio Reaction Code
  
  
  
  
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
        
        //map value to different audio reactions
        
        
       
        
        
         handvalue = abs(val);
        println(handvalue);
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
