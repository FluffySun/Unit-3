// Ema (Anyue) Sun
// 4.4

// Color Palette
color cream = #F5F5DC;
color lightPurple = #D1B3FF;
color mediumPurple = #A385E0;
color darkPurple = #7045A0;
color lightGreen = #B2D8B2;
color mediumGreen = #66A366;
color darkGreen = #2D5E2D;
color pink = #FF69B4;// Pink
color white = 255;// White
color black = 0;

color selectedColor;
float sliderY;  
float thickness;

void setup() {
  size(800, 600);
  selectedColor = lightPurple; //default
  sliderY = 200; //slider intial position
  thickness = 5;
}

void draw() {
  background(cream);

  // Thickness for slider
  thickness = map(sliderY, 100, 300, 1, 20);

  // Draw Color Buttons (Purple)
  drawCircleButton(50, 30, 15, lightPurple);
  drawCircleButton(100, 30, 15, mediumPurple);
  drawCircleButton(150, 30, 15, darkPurple);

  // Draw Color Buttons (Green)
  drawRectButton(40, 70, 30, 30, lightGreen);
  drawRectButton(90, 70, 30, 30, mediumGreen);
  drawRectButton(140, 70, 30, 30, darkGreen);

  // Vertical Slider Line
  stroke(pink);
  line(500, 100, 500, 300);

  // Slider Circle
  fill(pink);
  noStroke();
  circle(500, sliderY, 20);

  // Thickness Indicator (small circle to show thickness)
  stroke(black);
  fill(selectedColor);
  strokeWeight(thickness);
  circle(580, 200, 40);

  // Drawing Box
  noFill();
  stroke(black);
  strokeWeight(1);
  rect(25, 120, 750, 450);
}

void mouseDragged() {
  // Drag vertical slider
  if (mouseX > 485 && mouseX < 515 && mouseY > 100 && mouseY < 300) {
    sliderY = mouseY;
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
  if (dist(mouseX, mouseY, 50, 30) < 15) selectedColor = lightPurple;
  if (dist(mouseX, mouseY, 100, 30) < 15) selectedColor = mediumPurple;
  if (dist(mouseX, mouseY, 150, 30) < 15) selectedColor = darkPurple;

  // Rect (Green) Buttons
  if (mouseX > 40 && mouseX < 70 && mouseY > 70 && mouseY < 100) selectedColor = lightGreen;
  if (mouseX > 90 && mouseX < 120 && mouseY > 70 && mouseY < 100) selectedColor = mediumGreen;
  if (mouseX > 140 && mouseX < 170 && mouseY > 70 && mouseY < 100) selectedColor = darkGreen;
}
