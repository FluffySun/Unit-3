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
  size(800, 600);
  selectedColor = lightPurple;
  sliderY = 150;
  thickness = 5;
  background(cream); 
}

void draw() {
  //Thickness map function
  thickness = map(sliderY, 100, 300, 20, 1);  // Top = thickest, bottom = thinnest

  // Drawing box
  noFill();
  stroke(black);
  strokeWeight(2);
  rect(25, 100, 730, 400);

  // Color Buttons (Purple)
  drawCircleButton(50, 50, 25, lightPurple);
  drawCircleButton(110, 50, 25, mediumPurple);
  drawCircleButton(170, 50, 25, darkPurple);

  // Color Buttons (Green), closer together
  drawRectButton(230, 25, 40, 40, lightGreen);
  drawRectButton(290, 25, 40, 40, mediumGreen);
  drawRectButton(350, 25, 40, 40, darkGreen);

  // Vertical slider line
  stroke(pink);
  line(745, 100, 745, 300);

  // Slider handle
  fill(pink);
  noStroke();
  circle(745, sliderY, 20);

  // Thickness indicator
  stroke(black);
  fill(selectedColor);
  strokeWeight(thickness);
  circle(745, 350, 30);
}

void mouseDragged() {
  // Move slider
  if (mouseX > 735 && mouseX < 755 && mouseY > 100 && mouseY < 300) {
    sliderY = constrain(mouseY, 100, 300);
  }

  // Draw within canvas
  if (mouseX > 25 && mouseX < 755 && mouseY > 100 && mouseY < 500) {
    stroke(selectedColor);
    strokeWeight(thickness);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void drawCircleButton(int x, int y, int r, color c) {
  if (dist(mouseX, mouseY, x, y) < r) {
    stroke(white);
  } else {
    stroke(darkPurple);
  }
  fill(c);
  circle(x, y, r * 2);
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
  // Circle (Purple) Buttons
  if (dist(mouseX, mouseY, 50, 50) < 25) selectedColor = lightPurple;
  if (dist(mouseX, mouseY, 110, 50) < 25) selectedColor = mediumPurple;
  if (dist(mouseX, mouseY, 170, 50) < 25) selectedColor = darkPurple;

  // Rect (Green) Buttons
  if (mouseX > 230 && mouseX < 270 && mouseY > 25 && mouseY < 65) selectedColor = lightGreen;
  if (mouseX > 290 && mouseX < 330 && mouseY > 25 && mouseY < 65) selectedColor = mediumGreen;
  if (mouseX > 350 && mouseX < 390 && mouseY > 25 && mouseY < 65) selectedColor = darkGreen;
}
