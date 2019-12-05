//P1 prototype - Group 10 - Mikkel, Nanna, Rasmus, Nicolai, Mathilde  //<>// //<>//
//Object variables
Controls scene1Bt, scene2Bt, close1, close2;
Graphic sceneBg, scene1, scene2;

//String text files variables
String[] loremipsum;

//Image variables
PImage sceneBg_img;
PImage img_placeholder;
PImage paper1, paper2, paper3;

//Font variables
PFont titleFont, subTextFont;

//MouseX and MouseY variables, made public so all classes can use them
float mx, my;

//Global color variables
color white = 255;
color black = 0;

//Page int for switch 
int page;

void setup() {
  size(1024, 728);
  rectMode(RADIUS);

  //Load image files
  sceneBg_img = loadImage("ClassroomW2.png");
  img_placeholder = loadImage("img_placeholder.jpg");
  //Papers
  paper1 = loadImage("paper1.png");
  paper2 = loadImage("paper2.png");
  paper3 = loadImage("paper3.png");

  //Load fonts
  titleFont = createFont("chalk.ttf", 45); //Change font later
  subTextFont = createFont("Arial", 25);

  //Load strings from txt files
  loremipsum = loadStrings("loremipsum.txt");

  //Button contructors
  scene1Bt = new Controls(821, 535, 40, 40, false);
  scene2Bt = new Controls(691, 536, 40, 40, false);
  close1 = new Controls(50, 50, 40, 40, true);
  close2 = new Controls(50, 50, 40, 40, true);

  //Setup constructors for Graphic
  sceneBg = new Graphic(sceneBg_img, 0, 0, width, height);
  scene1 = new Graphic(width/2, 50, "Augemented Reality \nHow is it used?", loremipsum, paper2);
  scene2 = new Graphic(width/2, 50, "new title", loremipsum, paper1);
}

void draw() {
  background(white);

  //assign our mx and my variable to the build in mouseX and MouseY to save time
  mx = mouseX;
  my = mouseY;

  //println(mx + ", " + my); //Displays mouse x & y cord. makes it easier for development

  sceneBg.displayBg();  //Displays the background image function
  pageSelector();       //Calls the page selector

  scene1Bt.display();
  scene2Bt.display();   
  scene1Bt.pulse();
  scene2Bt.pulse();
}

//Method to display the diffrent information objects on the black board
void pageSelector() {   
  switch(page) {
  case 0:
    break;

  case 1:
    scene1.paperAnimation();
    close1.display();
    break;

  case 2:
    scene2.paperAnimation();
    close2.display();
    break;
  }
}

void closeBt(Controls close, Graphic scene) {
  if (close.mouseOver()) {
    scene.setClosed(true);
    println(scene.close);
  }
}

void openScene(Controls open, int pageNr, Graphic scene) {
  if (open.mouseOver()) {
    page = pageNr;
    scene.setOpen(true);
    println(scene.open);
  }
}

void mousePressed() {
  //https://forum.processing.org/two/discussion/558/creating-a-next-page-button
  //if (mouseButton == LEFT) {
  //  if (page > 0 && backBt.mouseOver()) {
  //    --page;
  //  } else if (page < 3 && scene2Bt.mouseOver()) { 
  //    ++page;
  //  }
  //}
  openScene(scene1Bt, 1, scene1);
  closeBt(close1, scene1);

  openScene(scene2Bt, 2, scene2);
  closeBt(close2, scene2);
}
