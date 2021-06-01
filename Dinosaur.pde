class Dinosaur extends Enemy {
  // Requirement #4: Complete Dinosaur Class

  final float TRIGGERED_SPEED_MULTIPLIER = 5;
  float speed = 1f ;
  int direction = 1;

  Dinosaur(float x, float y) {
    super(x, y);
  }


  void display() {
    if (x >= width-this.w || x <= 0) direction *= -1 ;
    pushMatrix();
    translate(x, y);
    if (direction == 1) {
      scale(1 , 1);
      image(dinosaur, 0, 0);
    } else if (direction == -1) {
      scale(-1, 1);
      image(dinosaur, -this.w, 0);
    }
    popMatrix();
  }

  void update() {
    boolean isDetected = false;
    if (player.y == this.y) {
      if ((direction == 1 && player.x > this.x)||(direction == -1 && player.x < this.x) ) isDetected = true;
      if(isDetected) speed *= TRIGGERED_SPEED_MULTIPLIER;
    } 
    if (x > width-this.w || x <= 0) speed *= -1;
    x += speed;
  }
  
  
  
	// HINT: Player Detection in update()
	/*
	float currentSpeed = speed
	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
	}
	*/
}
