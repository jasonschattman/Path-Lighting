import g4p_controls.*;

//USER PARAMETERS - CAN ALSO BE CHANGED IN THE GUI CONTROLS
int numLamps = 5;
int luminosity = 2000000;
int lampHeight = 100;
int yTop = 300;     //Top edge of the road
int yBottom = 500;  //Bottom edge of the road
float roadBumpiness = 0;

//OTHER GLOBAL VARIABLES
Lamp[] lamps;
Shard[] shards;   //Glass shards that fly when the user breaks a lamp bulb by clicking on it
float[][] brightness; //Stores the brightness of every (x, y) pixel on the road

boolean lightsChanged = true;
float gap;
int numShards = 100;
int resolution = 1; //1 = high-res (used when there's no animation), 3 = low-res (used during animation to reduce computation lag)
String mode = "shining";  //or "shattering"
int numShardsLanded = 0;

void setup() {
  size(1000, 700);
  createGUI();
  
  resetLamps(); //Called once at the start, and also when the user adds/removes lamps using the buttons
  
  brightness = new float[ width ][ yBottom-yTop ];  /*Allocates space in RAM for the 2D array
                                                      The road has 'width' pixels in the x-direction
                                                      and yBottom-yTop pixels in the y-direction */
  reshadeRoad();
}


void draw() {
  background(0); noFill(); noStroke();
  
  drawLamps();
  drawRoad(); 
  
  if( mode.equals("shattering") ) { //The user has just shattered a bulb and the pieces are flying
    frameRate(60); //High frame rate to make the glass shards seem to fly and fall at a realistic pace
    
    for( Shard s : shards ) {
      s.drawMe();
      s.update();
    }
    
    //As soon as the last shard lands on the ground, stop the animation and go back to normal shining mode
    if (numShardsLanded >= numShards ) {
      mode = "shining";
      numShardsLanded = 0;
    } 
  }
  
  else
    frameRate(2);  //If we're not in shatter mode (i.e. no animation), set a low frame rate to save computations needed to redraw the road in each frame
}
