//P1 prototype - Group 10 - Mikkel, Nanna, Rasmus, Nicolai, Mathilde //<>//
//Object variables
Controls scene1Bt, scene2Bt, scene3Bt, scene4Bt, close1, close2, close3, close4;
Graphic sceneBg, frontPage, scene1, scene2, scene3, scene4, boardText;

//String text files variables
String[] loremipsum, arText, traffic_text, objectreg_text, body_text;

//Image variables
PImage sceneBg_img;
PImage img_placeholder;
PImage closeImg;
PImage paper1, paper2, paper3;
PImage traffic_img, objectreg_img, body_img, glasses_img;

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
  closeImg = loadImage("close.png");
  traffic_img = loadImage("traffic.png");
  objectreg_img = loadImage("objectreg.png");
  body_img = loadImage("bodyimg.png");
  glasses_img = loadImage("glasses.png");

  //Papers
  paper1 = loadImage("paper1.png");
  paper2 = loadImage("paper2.png");
  paper3 = loadImage("paper3.png");

  //Load fonts
  titleFont = createFont("chalk.ttf", 45); //Change font later
  subTextFont = createFont("Arial", 25);

  //Load strings from txt files
  loremipsum = loadStrings("loremipsum.txt");
  arText = loadStrings("artext.txt");
  traffic_text = loadStrings("traffic.txt");
  objectreg_text = loadStrings("objectreg.txt");
  body_text = loadStrings("body.txt");

  //Button contructors
  final float closeX = 805, closeY = 81;   //Close button x and y position

  //Scene button x and y positions
  final float scene1BtX = 821, scene1BtY = 536;
  final float scene2BtX = 691, scene2BtY = 536;
  final float scene3BtX = 962, scene3BtY = 536;
  final float scene4BtX = 201, scene4BtY = 539;

  final int touchWH = 40;    //Button touch area, width and height

  //Controls(x position, y position, width, height, visible)
  scene1Bt = new Controls(scene1BtX, scene1BtY, touchWH, touchWH, false);
  scene2Bt = new Controls(scene2BtX, scene2BtY, touchWH, touchWH, false);
  scene3Bt = new Controls(scene3BtX, scene3BtY, touchWH, touchWH, false);
  scene4Bt = new Controls(scene4BtX, scene4BtY, touchWH, touchWH, false);

  //Controls(x position, y position, width, height, visible)
  close1 = new Controls(closeX, closeY, touchWH, touchWH, false);
  close2 = new Controls(closeX, closeY, touchWH, touchWH, false);
  close3 = new Controls(closeX, closeY, touchWH, touchWH, false);
  close4 = new Controls(closeX, closeY, touchWH, touchWH, false);

  //Setup constructors for Graphic
  sceneBg = new Graphic(sceneBg_img, 0, 0, width, height);
  
  boardText = new Graphic(145, 120, "1. Vælgt et papir\n2. Klik på X for at komme tilbage\n3. Dobbeltklik for at vælge et nyt papir");

  final float middle = width/2;
  final float subTextY = 480;
  
  //Graphic(x position, y position, title on paper, body text, background image, content image, font size, subtext y pos, img x, img y)                    
  scene1 = new Graphic(middle, 50, "Ansigtsudtryk\nog kropssprog", body_text, paper2, body_img, 20, 130, 22, 130);
  scene2 = new Graphic(middle, 50, "Uforudsete hændelser\ni trafikken", traffic_text, paper1, traffic_img, 20, subTextY, 85, 125);
  scene3 = new Graphic(middle, 50, "I klasselokalet", objectreg_text, paper3, objectreg_img, 20, 465, 85, 70);
  scene4 = new Graphic(middle, 50, "Hvad er \nArgumented Reality?", arText, paper1, glasses_img, 20, subTextY, 82, 125);
}

void draw() {
  background(white);

  //assign our mx and my variable to the build in mouseX and MouseY to save time
  mx = mouseX;
  my = mouseY;

  //println(mx + ", " + my); //Displays mouse x & y cord. makes it easier for development

  sceneBg.displayBg();  //Displays the background image function

  boardText.displayText();
  
  scene1Bt.display();
  scene2Bt.display();   
  scene3Bt.display();
  scene4Bt.display();
  scene1Bt.pulse();  
  scene2Bt.pulse();
  scene3Bt.pulse();
  scene4Bt.pulse();
  
  scene1.setTextBoxW(422);
  scene1.setSubtextX(305);
  scene3.setTextBoxW(655);

  //frontPage.displayText();

  pageSelector();       //Calls the page selector
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

  case 3:
    scene3.paperAnimation();
    close3.display();
    break;

  case 4:
    scene4.paperAnimation();
    close4.display();
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

  openScene(scene3Bt, 3, scene3);
  closeBt(close3, scene3);

  openScene(scene4Bt, 4, scene4);
  closeBt(close4, scene4);
}
