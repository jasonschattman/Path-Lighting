//USES THE CURRENT SETTINGS OF THE LAMPS TO SHADE THE ROAD, PIXEL BY PIXEL
void reshadeRoad() {
 
  //For every pixel on the road...
  for (int xRoad = 0; xRoad < width; xRoad++ ) {
    for (int yRoad = 0; yRoad < yBottom-yTop; yRoad++ ) {

      //Sets the brightness of the current pixel at index [xRoad, yRoad] to zero at the start
      brightness[ xRoad ][ yRoad ] = 0.0;

      //For every lamp that's on, add a bit of brightness to the current pixel, depending on the lamp's luminosity and its distance to the pixel
      for ( Lamp lamp : lamps ) {
        if( lamp.on ) {
          float zRoad = random( -roadBumpiness, roadBumpiness ); //Adds some randomness to model bumpiness in the road
          
          //Computes the squared distance from the current pixel to the current lamp
          float distSq = pow( xRoad - lamp.x, 2) + pow( yTop + yRoad - lamp.y, 2) + pow( zRoad - lamp.z, 2);

          //Adds to the brightness from the current lamp using the inverse square law for luminosity
          brightness[ xRoad ][ yRoad ] += lamp.luminosity / distSq; //inverse square law
        }
      }
    }
  }
}
