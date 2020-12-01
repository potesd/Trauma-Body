//final version for audio interaction set to be imported into proximity tracker 
import processing.sound.*;//import sound library
import processing.serial.*;//import serial processing library
import tsps.*;
TSPS tspsReceiver;
int lastDrawn = 0;
boolean playing = false; // sets a boolean to be checked against isPlaying()
boolean peoplePlaying = false; // sets booleans for each sound to have been interacted with
boolean level1played = false;//these booleans make it so that I can have a log of what interactions have been triggered and then not trigger twice in a row.
boolean level2played = false; // the code checks to see which boolean has been triggered before each reaction. it won't make the same reaction twice except for the touch based one. 
boolean level3played = false;
boolean level4played = false;
boolean people1played = false;
boolean people2played = false;
boolean people3played = false;
boolean touchplayed = false; // sets boolean for touch having been triggered last

Serial myPort;        // The serial port
int xPos = 1;         // horizontal position of the graph
float levels = 0;//creates the float for levels which is then converted to trigger
float touchlevel = 18;

SoundFile person1;//instantiate the soundfiles
SoundFile level2;
SoundFile level3;
SoundFile people3;
SoundFile level4;
SoundFile people5;
SoundFile people5level4;
SoundFile touch;
int amountOfPeople = 0;

void setup () {
  // set the window size:
  size(400, 300);

  person1 = new SoundFile(this, "person1.aiff"); // name and declare the files associated with each sound
  level2 = new SoundFile(this, "level2.aiff");
  level3 = new SoundFile(this, "level3.aiff");
  level4 = new SoundFile(this, "level4.aiff");
 people5 = new SoundFile(this, "people5.aiff");
 people3 = new SoundFile(this, "people3.aiff");
  people5level4 = new SoundFile(this, "people5level4.aiff");
  touch = new SoundFile(this, "touch.aiff");
  
  
  tspsReceiver= new TSPS(this, 12000);
  myPort = new Serial(this, Serial.list()[0], 9600); // I could also use COM3

  myPort.bufferUntil('\n'); // don't generate a serialEvent() unless you get a newline character:

  // set initial background:
  background(0);
}

void draw () {
  amountOfPeople = tspsReceiver.people.size();
  //println("# People: " + amountOfPeople);

  float trigger = levels;
  
    //println("AMT Touch: " + touchlevel);
  //essentially just draws the graph that shows the levels. I do this to troubleshoot what's happening
  // draw the line:
  stroke(127, 34, 255);
  line(xPos, height, xPos, height - levels);
  // at the edge of the screen, go back to the beginning:
  if (xPos >= width) {//if the x position is passed the width of the screen then reset
    xPos = 0;
    background(0);
  } else { //otherwise count up by 1
    // increment the horizontal position:
    xPos++;
  } // all of this code generates the graph

   playing = touch.isPlaying() || person1.isPlaying() || level2.isPlaying() || level3.isPlaying() || level4.isPlaying() ||people5.isPlaying()|| people3.isPlaying() || people5level4.isPlaying() ; // this bit of code sets the boolean playing to match the isPlaying() boolean associated with each level. 
  

  
  
  //if ( tspsReceiver.people.size() == 1 && trigger == 20 && !playing  && millis() - lastDrawn > 3000 ){
  //  background( 0 );
  //  textAlign( CENTER );
  //  person1.play(); // repl 
    
    
    
    
    
    
    

    
  //}
   if (touchlevel <= 17) { //if the trigger is = to max volume
    if (!touchplayed ) { // and the playing boolean is NOT true
     level3.stop();
     level2.stop();
     level4.stop();
    person1.stop();
    people3.stop();
    people5.stop();
    people5level4.stop();
      touch.play(); // then play level 4
        level1played = false;
      level2played = false;
      level3played = false;
      level4played = false;
      people1played = false;
      people2played = false;
      people3played = false;
      touchplayed = true;
    }
  } 
   
  
  //level 4 is triggered
  if (trigger == 80) { //if the trigger is = to max volume
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
      touchplayed = false;
    }
  } 

  //level 3 is triggered
  if (trigger == 60) {//if the trigger is = to max volume
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
      touchplayed = false;
    }
  } 

  //level2 is triggered
  if (trigger == 40) {//if the trigger is = to max volume
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
      touchplayed = false;
    }
  }  

  //level is triggered
  if (trigger == 20  && tspsReceiver.people.size() == 1) {  //checks to see that trigger = 20
    if (!playing&&!level1played) {// and the playing boolean is NOT true
      person1.play(); // plays level if the conditions are met
      level1played = true;
      level2played = false;
      level3played = false;
      level4played = false;
      people1played = false;
      people2played = false;
      people3played = false;
      touchplayed = false;
    }
  }
  
  if ( tspsReceiver.people.size() == 3  && !playing && millis() - lastDrawn > 2000 ){
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
      touchplayed = false;
    }
  }
  
  
  if ( tspsReceiver.people.size() >= 4 && !playing && millis() - lastDrawn > 2000 ){
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
      touchplayed = false;
    }
  }
  //trigger if more than 5 people and lots of volume
  if (trigger == 80 && tspsReceiver.people.size() >= 3  && millis() - lastDrawn > 2000) { //if the trigger is = to max volume
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
      touchplayed = false;
    }
  }
}

void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n'); // reads the string until the end
  //of the line, its important to use println in arduino.

  if (inString != null) {//as long as something is read
    // trim off any whitespace
    inString = trim(inString);
    int sensors[] = int(split(inString, ','));
    //levels =;//convert inString into an inByte to be able to read
   
  levels = sensors[0];
  touchlevel = sensors[1];
println("Sensor 1: " + levels + "   Sensor 2: " + touchlevel + "   #ofPeople: " + amountOfPeople);
  }
}
