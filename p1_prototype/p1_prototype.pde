//P1 prototype - Group 10 - Mikkel, Nanna, Rasmus, Nicolai, Mathilde 
//Object variables
Controls nextBt, backBt;
Graphic sceneBg, scene1, scene2;

//String text files variables
String[] loremipsum;

//Image variables
PImage sceneBg_img;
PImage img_placeholder;

//Font variables
PFont titleFont, subTextFont;

//MouseX and MouseY variables, made public so all classes can use them
public float mx, my;

//Global color variables
public color white = 255;
public color black = 0;

//Page int for switch 
private int page;

void setup() {
  size(1024, 728);
  rectMode(RADIUS);

  //Button contructors
  nextBt = new Controls(width/2 + 150, height/2, 50, 50);
  backBt = new Controls(width/2, height/2, 50, 50);

  //Setup/Load image files
  sceneBg_img = loadImage("scene1_bg.jpg");
  img_placeholder = loadImage("img_placeholder.jpg");

  //Load fonts
  titleFont = createFont("chalk.ttf", 45); //Change font later
  subTextFont = createFont("Arial", 25);

  //Load strings from txt files
  loremipsum = loadStrings("loremipsum.txt");

  //Setup constructors for Graphic
  sceneBg = new Graphic(sceneBg_img, 0, 0);
  scene1 = new Graphic(width/2, 50, "Augemented Reality", loremipsum, img_placeholder);
  scene2 = new Graphic(width/2, 50, "new title", loremipsum, img_placeholder);
}

void draw() {
  background(white);

  //assign our mx and my variable to the build in mouseX and MouseY to save time
  mx = mouseX;
  my = mouseY;

  sceneBg.displayBg();  //Displays the background image method
  pageSelector();       //Calls the page selector

  nextBt.display();     
  backBt.display();
  nextBt.pulse();
  backBt.pulse();
}

void pageSelector() {
  switch(page) {
  case 0:
    break;

  case 1:
    scene1.displayText();
    break;

  case 2:
    scene2.displayText();
    break;
  }
}

void mousePressed() {
  //https://forum.processing.org/two/discussion/558/creating-a-next-page-button
  if (mouseButton == LEFT) {
    if (page > 0 && backBt.mouseOver()) {
      --page;
    } else if (page < 3 && nextBt.mouseOver()) { 
      ++page;
    }
  }
}
