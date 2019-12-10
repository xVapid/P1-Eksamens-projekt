class Controls {
  private float x, y;           //X & Y cord. 
  private int w, h;             //Width and height
  private boolean visible;      //Boolean used for testing purpose
  private float diameter = 5;   //Diameter of pulse circle
  private float opacity = 255;  //Start opacity of pulse circle

  Controls(float x, float y, int w, int h, boolean visible) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.visible = visible;
  }

  void display() {               //Draws the touchable area
    noStroke();
    
    if (visible) {               //If the boolean visible is true
      fill(black);               //Then fill black
    } else {
      fill(black, 0);            //Else fill with 0 opacity
    }
    
    rect(x, y, w, h);
  }

  void pulse() {
    final float opacityEnd = 0;  //If opacity reach this number then reset
    final float pulseSize = 1.6; //Lower number = bigger circle
    final float pulseWeight = 4; //Circle stroke weight

    if (opacity < opacityEnd) {  //If opacity reaches the opacity end value
      diameter = 5;              //Sets diamter back to start
      opacity = 255;             //Sets opacity back to start
    } else {
      diameter++;                //else increase diameter 
      opacity -= pulseSize;      //and decrease opacity
    }

    //Draw pulse circle 
    noFill();
    stroke(white, opacity); 
    strokeWeight(pulseWeight);
    ellipse(x, y, diameter, diameter);
  }

  boolean mouseOver() {
    //Returns true if the following conditions is met
    return mx > x - w && mx < x + w && my > y - h && my < y + h;
  }
}
