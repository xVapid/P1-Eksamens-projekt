class Graphic {
  private PImage image;        //Image variable
  private float x, y;          //X and Y position var
  private int w, h;            //Width and height for images
  private String title;        //Title text var
  private String[] subText;    //String array text var
  private int paperW = 745;
  private int paperH = 760;
  private float paperX = 140;
  private float paperY = height;
  private float animationSpeed = 30;
  private boolean close = false;
  private boolean open;

  //Constructor for texts 
  Graphic(float x, float y, String title, String[] subText, PImage image) {
    this.x = x;
    this.y = y;
    this.title = title;
    this.subText = subText;
    this.image = image;
  }

  //Constructor for background images 
  Graphic(PImage image, float x, float y, int w, int h) {
    this.image = image;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
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
    image(image, x, y, w, h);
  }

  void paperAnimation() {
    float textX = 740/2;
    float titleY = 70;
    int textBoxW = 740;
    int textBoxH = 759;
    float subtextX = 20;
    float subTextY = titleY + 113;
    int animationStopPos = 10;

    if (paperY > animationStopPos 
      && close == false && open == true) {
      paperY -= animationSpeed;
    } else if (close == true) {
      paperY += animationSpeed;
      if (paperY > height) { //DET ER NOK NOGET MED DET HER AT GØRE MAN SKAL KLIKKE FLERE GANGE FØR DEN KOMMER FREM
        close = false; 
        open = false;
        page = 0;            //Reset pageSelector in main back to case 0
      }
    }

    pushMatrix();

    translate(paperX, paperY);

    //Paper scene background
    fill(white, 0);
    noStroke();
    rectMode(CORNER);
    rect(0, 0, paperW, paperH);
    image(image, 0, 0);

    //Title text
    fill(black);
    textFont(titleFont);
    textAlign(CENTER);
    text(title, textX, titleY);

    //Text box
    fill(black);
    textFont(subTextFont);
    textAlign(LEFT);
    for (int i = 0; i < subText.length; i++) {  //For loop that prints out a string array
      text(subText[i], subtextX, subTextY, textBoxW, textBoxH);
    }
    
    popMatrix();
  }

  void setClosed(boolean close) {
    this.close = close;
  }

  void setOpen(boolean open) {
    this.open = open;
  }
}
