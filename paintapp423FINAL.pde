// Ema (Anyue) Sun
//4.18

// Color Palette
color cream = #F5F5DC;
color lightPurple = #D1B3FF;
color mediumPurple = #A385E0;
color darkPurple = #7045A0;
color lightGreen = #B2D8B2;
color mediumGreen = #66A366;
color darkGreen = #2D5E2D;
color pink = #FF69B4;
color white = 255;
color black = 0;

color selectedColor;
float sliderY;
float thickness;

PImage stamp;
boolean stampOn=false;

void setup() {
  size(1000, 800);
  selectedColor=lightPurple;
  sliderY = 150;
  thickness = 5;
  background(cream);
  ellipseMode(CENTER); //just learned this in while loops (don't knowhow to use it)
  stamp = loadImage("ul86ixgkx8wb1.jpg"); //STAMP file NAME HERE (WHY NOT WORK?)
}

void draw() {
  //Thickness map function
  thickness = map(sliderY, 300, 100, 1, 20);// top=thick,bottom=thin

  //Drawing box
  noFill();
  stroke(black);
  strokeWeight(2);
  rect(25, 100, 900, 650);

  //Purple Buttons
  noStroke();
  drawCircleButton(50, 50, 25, lightPurple);
  drawCircleButton(110, 50, 25, mediumPurple);
  drawCircleButton(170, 50, 25, darkPurple);

  //Green Buttons
  drawRectButton(230, 25, 40, 40, lightGreen);
  drawRectButton(290, 25, 40, 40, mediumGreen);
  drawRectButton(350, 25, 40, 40, darkGreen);

  //No trailing Circles
  fill(cream);
  noStroke();
  rect(930, 90, 30, 230);

  // Vertical slider line
  stroke(pink);
  strokeWeight (4);
  line(950, 100, 950, 300);

  // Slider handle
  fill(pink);
  noStroke();
  circle(950, sliderY, 20);

  //---Function buttons---
  //Load Button
  if (mouseX >720 && mouseX <780  && mouseY >50  && mouseY <80 ) {
    fill(#CCCCCC);
  } else {
    fill(black);
  }
  stroke(white);
  rect(720, 50, 60, 30);
  fill(white);
  text("Load", 740, 70);
  
  //New Button
  if (mouseX > 790 && mouseX < 850 && mouseY > 50 && mouseY < 80) {
    fill(#CCCCCC);
  } else {
    fill(black);
  }
  stroke(white);
  rect(790, 50, 60, 30);
  fill(white);
  text("New", 810, 70);

  //Save Button
  if (mouseX > 650 && mouseX < 710 && mouseY > 50 && mouseY < 80) {
    fill(#CCCCCC);
  } else {
    fill(black);
  }
  stroke(white);
  rect(650, 50, 60, 30);
  fill(white);
  text("Save", 670, 70);
  
  // Thickness indicator
  strokeWeight(map(sliderY, 300, 100, 20, 1));
  stroke(black);
  fill(selectedColor);
  circle(450, 45, map(sliderY, 300, 100, 20, 40));
  
  //---STAMP BUTTON VISUAL---
  stroke(black);
  strokeWeight(1);
  fill(stampOn?#FFAAAA:white); 
  rect(900, 50, 40, 40);
  image(stamp, 900, 50, 40, 40);  
  //Stamp???
}

//------Function buttons end------

void mouseDragged() {
  //Move slider
  if (mouseX>940 && mouseX<960 && mouseY>100 && mouseY<300) {
    if (mouseY<100) sliderY=100;
    else if (mouseY>300) sliderY=300;
    else sliderY=mouseY;
  }

  //draw inside canvas
  if (mouseX>25 && mouseX<925 && mouseY>100 && mouseY<750) {
    stroke(selectedColor);
    strokeWeight(thickness);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  
  //REPLACE UPPER PART? ---STAMP?---
  if (mouseX > 25 && mouseX < 925 && mouseY > 100 && mouseY < 750) {
  if (stampOn) {
    image(stamp, mouseX - 20, mouseY - 20, 40, 40);//draw stamp
  } else {
    stroke(selectedColor);
    strokeWeight(thickness);
    line(pmouseX, pmouseY, mouseX, mouseY);//normal
  }
}
//---Stamp?---
}

void drawCircleButton(int x, int y, int r, color c) {
  noStroke();
  fill(c);
  ellipse(x, y, 25, 25);

  if (dist(mouseX, mouseY, x, y) < r) {
    stroke(white);
    strokeWeight(2);
    noFill();
    ellipse(x, y, 25, 25);
  } else {
    stroke(darkPurple);
    strokeWeight(1);
    noFill();
    fill(c);
    ellipse(x, y, 50, 50);
  }
}
void drawRectButton(int x, int y, int w, int h, color c) {
  if (mouseX>x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    stroke(white);
  } else {
    stroke(darkGreen);
  }
  fill(c);
  rect(x, y, w, h);
}

void mouseReleased() {
  //Circle/Purple Buttons
  if (dist(mouseX, mouseY, 50, 50) < 25) selectedColor = lightPurple;
  if (dist(mouseX, mouseY, 110, 50) < 25) selectedColor = mediumPurple;
  if (dist(mouseX, mouseY, 170, 50) < 25) selectedColor = darkPurple;

  //Rect.Green Buttons
  if (mouseX > 230 && mouseX < 270 && mouseY > 25 && mouseY < 65) selectedColor = lightGreen;
  if (mouseX > 290 && mouseX < 330 && mouseY > 25 && mouseY < 65) selectedColor = mediumGreen;
  if (mouseX > 350 && mouseX < 390 && mouseY > 25 && mouseY < 65) selectedColor = darkGreen;

  //---FUNCTION BUTTONS---
//---HOW TO DO THIS?---
// Load button
if (mouseX > 720 && mouseX < 780 && mouseY > 50 && mouseY < 80) {
  selectInput("Pick an image to load", "openImage");
}

//---Stamp button???---
if (mouseX > 900 && mouseX < 940 && mouseY > 50 && mouseY < 90) {
  stampOn = !stampOn;
}
//---STAMPBUTTON---
 
  //Clear canvas/New Button
  if (mouseX>750 && mouseX<810 && mouseY>50 && mouseY<80) {
    fill(cream);
   noStroke();
   rect(25, 100, 900, 650);
  }

  //Save button
  if (mouseX>650 && mouseX<710 && mouseY>50 && mouseY<80) {
    selectOutput("Choose a name for your new image file", "saveImage");
  }
  //------Function Buttons End------
}

//---???SAVE FUNCTION???---
void saveImage(File f) {
  if (f != null) {
    PImage canvas = get(25, 100, 900, 650); //?,?,width height
    canvas.save(f.getAbsolutePath());
  }
}

void openImage(File f) {
  if (f != null) {
    //KLUDGE
    int n = 0;
    while (n < 10) {
      PImage pic = loadImage(f.getPath());
      image(pic, 25, 100, 900, 650); //match canva
      n=n+1;
    }
  }
}
