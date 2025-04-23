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

void setup() {
  size(1000, 800);
  selectedColor=lightPurple;
  sliderY = 150;
  thickness = 5;
  background(cream); 
  ellipseMode(CENTER);
}

void draw() {
  //Thickness map function
  thickness = map(sliderY, 300, 100, 1, 20);// top=thick, bottom=thin

  // Drawing box
  noFill();
  stroke(black);
  strokeWeight(2);
  rect(25, 100, 900, 650);

  // Color Buttons (Purple)
  noStroke();
  drawCircleButton(50, 50, 25, lightPurple);
  drawCircleButton(110, 50, 25, mediumPurple);
  drawCircleButton(170, 50, 25, darkPurple);

  // Color Buttons (Green), closer together
  drawRectButton(230, 25, 40, 40, lightGreen);
  drawRectButton(290, 25, 40, 40, mediumGreen);
  drawRectButton(350, 25, 40, 40, darkGreen);

  //No trailing Circles
  fill(cream);
  noStroke();
  rect(770,90,30,230);
  
  // Vertical slider line
  stroke(pink);
  strokeWeight (4);
  line(950, 100, 950, 300);

  // Slider handle
  fill(pink);
  noStroke();
  circle(950, sliderY, 20);

  // Thickness indicator
strokeWeight(map(sliderY, 300, 100, 20, 1)); 
stroke(black);
fill(selectedColor);
circle(450, 45, map(sliderY, 300, 100, 20, 40));
  
  //---Function buttons---
//New Button
if (mouseX > 750 && mouseX < 810 && mouseY > 50 && mouseY < 80) {
  fill(#CCCCCC);
} else {
  fill(black);
}
stroke(white);
rect(750, 50, 60, 30);
fill(white);
text("New", 770, 70);

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
}

void drawButton(int x, int y, int w, int h, String label) {
  //check mouse
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    fill(#DDDDDD);  //grey hover color
  } else {
    fill(white);  
  }

  stroke(black);
  strokeWeight(1.5);
  rect(x, y, w, h, 8); //round corners

  fill(black);
  textAlign(CENTER, CENTER);
  textSize(14);
  text(label, x + w / 2, y + h / 2); //HOW DOES LABEL WORK?
}
  //------Function buttons end------

void mouseDragged() {
  //Move slider
if (mouseX > 940 && mouseX < 960 && mouseY > 100 && mouseY < 300) {
  if (mouseY < 100) sliderY = 100;
  else if (mouseY > 300) sliderY = 300;
  else sliderY = mouseY;
}

  //draw inside canvas
if (mouseX > 25 && mouseX < 925 && mouseY > 100 && mouseY < 750) {
    stroke(selectedColor);
    strokeWeight(thickness);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void drawCircleButton(int x, int y, int r, color c) {
  noStroke();
  fill(c);
  ellipse(x,y,25,25);
  
  if (dist(mouseX, mouseY, x, y) < r) {
    stroke(white);
    strokeWeight(2);
    noFill();
    ellipse(x,y,r*2,r*2); //WHAT IS R*2
  } else {
    stroke(darkPurple);
    strokeWeight(1);
    noFill();
    fill(c);
    ellipse(x, y, r*2,r*2);
}
}

void drawRectButton(int x, int y, int w, int h, color c) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
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
  //Clear canvas
if (mouseX > 750 && mouseX < 810 && mouseY > 50 && mouseY < 80) {
  background(cream);
}

  //Save button 
  if (mouseX > 650 && mouseX < 710 && mouseY > 50 && mouseY < 80) {
  selectOutput("Choose a name for your new image file", "saveImage");
}
  
//------Function Buttons End------

}

//---???SAVE FUNCTION???---
void saveImage(File f) {
  if (f != null) {
    PImage canvas = get(25, 100, 900, 650); // This matches the draw area!
    canvas.save(f.getAbsolutePath());
  }
}

void openImage(File f) {
  if (f != null) {
    int n = 0;
    while (n < 10) {
      PImage pic = loadImage(f.getPath());
      image(pic, 25, 100); // Draw image on canvas only
      n++;
    }
  }
}
