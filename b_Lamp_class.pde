class Lamp {
  float x, y, z;
  float luminosity;
  float colorValue;
  boolean on;
  
  Lamp( float x, float y, float h, int lum ) {
    this.x = x; this.y = y; this.z = h;
    setLuminosity( lum ) ;
    this.on = true;
  }
  
  void drawMe() {
    strokeWeight(10);
    stroke(200);
    line(this.x, this.y, this.x, this.y-this.z); //Draws the post
    
    if( this.on ) 
      fill( this.colorValue, this.colorValue, 0 ); //Some shade of yellow, which depends on the lamp's luminosity
    
    else
      fill(50);  //Use dull grey for the bulb color if the lamp is off
    
    strokeWeight(5);
    circle( this.x, this.y - this.z, 40 ); //Draws the bulb and its casing
  }
 
  
  void setLuminosity(int lum) {
    this.luminosity = lum;
    this.colorValue = this.luminosity/5000; //Dividing by 5000 puts the color value roughly between 0-255
  }
  
  
  void setHeight( int height ) {
    this.z = height;
  }
  
  
  void toggle() {
    this.on = !this.on;
  }
}
