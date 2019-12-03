class Graphic {
  private PImage image;        //Image variable
  private float x, y;          //X and Y position var
  private String title;        //Title text var
  private String[] subText;    //String array text var

  //Constructor for texts 
  Graphic(float x, float y, String title, String[] subText, PImage image) {
    this.x = x;
    this.y = y;
    this.title = title;
    this.subText = subText;
    this.image = image;
  }

  //Constructor for background images 
  Graphic(PImage image, float x, float y) {
    this.image = image;
    this.x = x;
    this.y = y;
  }

  void displayText() {
    float textX = x;
    float titleY = y;
    float subTextY = titleY + 40;

    //String title
    fill(white);
    textFont(titleFont);
    textAlign(CENTER, CENTER);
    text(title, textX, titleY);

    //String subtext
    int textBoxW = 300;
    int textBoxH = 200;
    
    fill(white);
    textFont(subTextFont);
    textAlign(LEFT);
    for (int i = 0; i < subText.length; i++) {  //For loop that prints out a string array
      text(subText[i], textX + 150, subTextY + 20 + i, textBoxW, textBoxH); //FIX THIS
    }

    //Display image
    float imgX = 50;
    float imgY = 30;
    
    image(image, imgX, imgY);
  }     

  void displayBg() {        //Displays the background image
    image(image, x, y);
  }
}
