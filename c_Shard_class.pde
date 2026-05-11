//A shard is represented as a triangle with 1 fixed vertex, and the other 2 vertices randomly chosen
class Shard {
  PVector pos, vel; //The chosen vertex and its speed
  float dx1, dy1, dx2, dy2; //The differences between the two random vertices and the fixed one (pos)
  color col;
  boolean flying;

  Shard(float x, float y) {
    this.pos = new PVector(x, y); //The fixed vertex

    //Randomly picking the displacements for the other 2 vertices
    this.dx1 = random(4, 7);
    this.dy1 = random(-8, 8);
    this.dx2 = this.dx1 + random(-3, 3);
    this.dy2 = this.dy1 + random(-3, 3);
    
    //The shard will fly off from the shattered blub at a random angle and speed
    float randAngle = random(TWO_PI); 
    float randSpeed = random(11);

    //Computes the (x,y) velocity of the shard based on its angle and speed
    this.vel = new PVector( randSpeed * cos(randAngle), -randSpeed * sin(randAngle));
    
    this.flying = true;
  }

  void drawMe() {
    noStroke();

    if( this.flying ) 
      this.col = random(100) > 20 ? color(220) : color(20); //Creates a random shimmering effect between bright and dark as the shard flies
      
    else
      this.col = color(220);  //If the shard is lying still, just shade it (almost) white
      
    fill(this.col);

    triangle(this.pos.x, this.pos.y,  //The fixed vertex
             this.pos.x + this.dx1, this.pos.y + this.dy1, //Random vertex #1
             this.pos.x + this.dx2, this.pos.y + this.dy2); //Random vertex #2
  }
  
  
  void update() {
    if( this.flying ) {
      this.pos.add( this.vel );
      this.vel.add( 0, 1.1 );  //Adds to the shard's vertical speed in each frame, simulating gravity 
      this.vel.mult( 0.99 );   //Slows the shard down by 1% in each frame, simulating air resistance
    
      if( this.pos.y > yBottom) { //If the shard has reached the bottom of the road, make it stop flying
        this.flying = false;
        numShardsLanded++;
      }
      
      else if (this.pos.y > yTop ) {  //If the shard has reached the road area, give it a random chance of stopping in each frame
        float rand = random(100);
        
        if (rand < 60) {
          this.flying = false;
          numShardsLanded++;
        }
      }
    }
  }  
}
