void resetLamps() {
  lamps = new Lamp[ numLamps ];
  
  gap = (width-100)/(numLamps-1);  //Computes the gap between lamps based on how many there are,
                                   //while leaving a padding of 50 pixels on either side of the screen
  
  //Creates the lamps
  for (int i = 0; i < numLamps; i++ ) {
    lamps[i] = new Lamp( 50+gap*i, yTop, lampHeight, luminosity); 
  }
  
  //Initially turns the third lamp off, just for variety and to give the user something to turn on.
  if( numLamps >= 3)
    lamps[2].toggle();
    
  mode = "shining";
}


void resetShards( int xStart, int yStart ) {
  shards = new Shard[numShards];
  
  for(int i=0; i < numShards; i++){
    shards[i] = new Shard(xStart, yStart);
  }
}


void drawLamps() { 
  for ( Lamp l : lamps )
    l.drawMe();
}


void drawRoad() {
  if ( mode.equals("shining") )
    resolution =  1;
    
  else  //mode ="shattering"
    resolution = 3;

  for( int xRoad = 0; xRoad < width; xRoad += resolution ) {
    for( int yRoad = 0; yRoad < yBottom-yTop; yRoad += resolution ) {  
      stroke( brightness[xRoad][yRoad] );
      point( xRoad, yTop + yRoad );
    }
  }
}
