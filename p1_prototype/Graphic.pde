class Graphic {
  private PImage bgImage;      //Image variable
  private PImage contentImg;
  private float x, y;          //X and Y position var
  private int w, h;            //Width and height for images
  private String title;        //Title text var
  private String[] subText;    //String array text var
  private int textSize;
  private int paperW = 745;
  private int paperH = 760;
  private float paperX = 140;
  private float paperY = height;
  private float subTextY = 480;
  private float animationSpeed = 30;
  private float contentImgX;
  private float contentImgY;
  private boolean close = false;
  private boolean open;
  private int textBoxW = 720;
  private int textBoxH = 759;
  private float subtextX = 20;

  //Constructor for texts 
  Graphic(float x, float y, String title, String[] subText, PImage bgImage, PImage contentImg, 
    int textSize, float subTextY, float contentImgX, float contentImgY) {
    this.x = x;
    this.y = y;
    this.title = title;
    this.subText = subText;
    this.bgImage = bgImage;
    this.contentImg = contentImg;
    this.textSize = textSize;
    this.subTextY = subTextY;
    this.contentImgX = contentImgX;
    this.contentImgY = contentImgY;
  }
  
  Graphic(float x, float y, String title) {
    this.x = x;
    this.y = y;
    this.title = title; 
  }

  //Constructor for background images 
  Graphic(PImage bgImage, float x, float y, int w, int h) {
    this.bgImage = bgImage;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void displayText() {
    //String title
    fill(black);
    textFont(titleFont);
    textAlign(LEFT);
    text(title, x, y);
  }     

  void displayBg() {        //Displays the background image
    image(bgImage, x, y, w, h);
  }

  void paperAnimation() {
    float textX = 740/2;
    float titleY = 50;
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
        println("closed");
      }
    }

    pushMatrix();

    translate(paperX, paperY);

    //Paper scene background
    fill(white, 0);
    noStroke();
    rectMode(CORNER);
    rect(0, 0, paperW, paperH);
    image(bgImage, 0, 0);

    //Title text
    fill(black);
    textFont(titleFont);
    textAlign(CENTER);
    textLeading(45);           //sets the space between lines
    text(title, textX, titleY);

    //Content image
    image(contentImg, contentImgX, contentImgY);

    //Text box
    fill(black);
    textFont(subTextFont);
    textAlign(LEFT);
    textSize(textSize);
    textLeading(25);
    for (int i = 0; i < subText.length; i++) {  //For loop that prints out a string array
      text(subText[i], subtextX, subTextY, textBoxW, textBoxH);
    }

    //Display close button grahpic
    float closeX = 638;
    float closeY = 64;

    image(closeImg, closeX, closeY);

    popMatrix();
  }

  void setClosed(boolean close) {
    this.close = close;
  }

  void setOpen(boolean open) {
    this.open = open;
  }

  void setTextBoxW(int textBoxW) {
    this.textBoxW = textBoxW;
  }
  
  void setSubtextX(int subtextX) {
   this.subtextX = subtextX; 
  }
}
