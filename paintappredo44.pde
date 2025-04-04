// Ema (Anyue) Sun
// 4.4

//Color Palette
color cream = #F5F5DC;

// Purple circle palette
color lightPurple = #D1B3FF;
color mediumPurple = #A385E0;
color darkPurple = #7045A0;

// Green rect palette
color lightGreen = #B2D8B2;
color mediumGreen = #66A366;
color darkGreen = #2D5E2D;

color white = color(255);
color black = color(0);

// Line
color darkOutlinePurple = #7045A0;
color darkOutlineGreen = #1F3D1F;

// Set color
color selectedColor;

void setup() {
  size(800, 600);
  strokeWeight(5);
  selectedColor = lightPurple; // Default
}

void draw() {
  background(cream);

  // Circle Buttons Purple
  drawCircleButton(100, 150, 50, lightPurple);
  drawCircleButton(100, 300, 50, mediumPurple);
  drawCircleButton(100, 450, 50, darkPurple);

  // Rectangle Buttons Green
  drawRectButton(300, 100, 200, 100, lightGreen);
  drawRectButton(300, 250, 200, 100, mediumGreen);
  drawRectButton(300, 400, 200, 100, darkGreen);

  // Indicator
  stroke(0);
  fill(selectedColor);
  circle(650, 300, 200);
}

//Draw function
void drawCircleButton(int x, int y, int r, color c) {
  if (dist(mouseX, mouseY, x, y) < r) {
    stroke(white);
  } else {
    stroke(darkOutlinePurple);
  }
  fill(c);
  circle(x, y, r * 2);
}

void drawRectButton(int x, int y, int w, int h, color c) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    stroke(white);
  } else {
    stroke(darkOutlineGreen);
  }
  fill(c);
  rect(x, y, w, h);
}

//Tactile
void mouseReleased() {
  // Circle (Purple) Buttons
  if (dist(mouseX, mouseY, 100, 150) < 50) selectedColor = lightPurple;
  if (dist(mouseX, mouseY, 100, 300) < 50) selectedColor = mediumPurple;
  if (dist(mouseX, mouseY, 100, 450) < 50) selectedColor = darkPurple;

  // Rect (Green) Buttons
  if (mouseX > 300 && mouseX < 500 && mouseY > 100 && mouseY < 200) selectedColor = lightGreen;
  if (mouseX > 300 && mouseX < 500 && mouseY > 250 && mouseY < 350) selectedColor = mediumGreen;
  if (mouseX > 300 && mouseX < 500 && mouseY > 400 && mouseY < 500) selectedColor = darkGreen;
}
