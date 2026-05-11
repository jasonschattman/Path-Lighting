//I just hacked your code, ha ha!
//I just undid your hack, demon! HA Take that!

print("You were here but no longer!");

void mouseClicked(){
  
  //Checks to see if any of the lamp bulbs was clicked...
  
  for ( Lamp l : lamps ) {
    if ( dist(mouseX, mouseY, l.x, l.y-l.z) < 40 ) { //If the dist between the mouse and the bulb is small enough...
      
      if( l.on ) { //If the bulb is currently on...
        l.toggle(); //Turn the bulb off
        redraw();
        reshadeRoad(); //Reshade the road now because the total lighting has been reduced
        
        resetShards( mouseX, mouseY ); //Gets the glass shards ready to fly!
        mode = "shattering";
        break;  //Stops the for-loop because we've already found out where the user clicked
      }
      
      else { //If the bulb is already off...
        l.toggle(); //Turn the bulb back on
        redraw();
        reshadeRoad();  //Reshade the road now because the total lighting has been increased
        
        mode = "shining";
        break;
      }      
    }
  }
}
