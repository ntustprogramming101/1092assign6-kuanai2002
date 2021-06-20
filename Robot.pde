class Robot extends Enemy {
  // Requirement #5: Complete Dinosaur Class

  float currentSpeed = 2f ;
  final int PLAYER_DETECT_RANGE_ROW = 2;
  final int LASER_COOLDOWN = 180;
  final int HAND_OFFSET_Y = 37;
  final int HAND_OFFSET_X_FORWARD = 64;
  final int HAND_OFFSET_X_BACKWARD = 16;

  void display(){
    
    pushMatrix();
      translate(x, y);
      if (currentSpeed > 0 ) {
        scale(1, 1);
        image(robot, 0, 0, w, h); 
      } else {
        scale(-1, 1);
        image(robot, -w, 0, w, h); 
      }
    popMatrix();

  }
  
  void update(){
    
    boolean checkY = false;
    boolean checkX = false;
    
    if( currentSpeed > 0 && x < player.x || currentSpeed < 0 && x > player.x ){
      checkX = true;
    }

    if( player.y >= y - PLAYER_DETECT_RANGE_ROW * SOIL_SIZE && player.y <= y + PLAYER_DETECT_RANGE_ROW * SOIL_SIZE){
      checkY = true ;
    }else{
      checkY = false;
      
    }    
  
    if( checkX && checkY){
      return;
      //Is laser's cooldown ready?
      //  True  > Fire laser from my hand!
      //  False > Don't do anything
    }else{
      x += currentSpeed ;
      if( x+SOIL_SIZE >= width || x <= 0){
      currentSpeed *= -1;
      }
    }
    
  }

  Robot(float x, float y){
  super(x,y);
  }
  
}
  
  // HINT: Player Detection in update()
  /*
  boolean checkX = ( Is facing forward AND player's center point is in front of my hand point )
          OR ( Is facing backward AND player's center point (x + w/2) is in front of my hand point )
  boolean checkY = player is less than (or equal to) 2 rows higher or lower than me
  if(checkX AND checkY){
    Is laser's cooldown ready?
      True  > Fire laser from my hand!
      False > Don't do anything
  }else{
    Keep moving!
  }
  */
