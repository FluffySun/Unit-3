// Ema (Anyue) Sun
// 4.18

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
float sliderX;  
float shade;

void setup() {
  size(800, 600);
  selectedColor = black;
  sliderX = 400;//initial slider
  shade = 0;//initial shade
  strokeWeight(5);
  selectedColor = lightPurple; // Default
}

void draw() {
// Map slider to shade
  shade = map(sliderX, 100, 700, 0, 255);
  background(shade);
  
//Slider Line
  stroke(pink);
  line(100, 300, 700, 300);

//Slider Circle
  fill(pink);
  noStroke();
  circle(sliderX, 300, 30);
  
  //Circle Buttons Purple
  drawCircleButton(50, 50, 25, lightPurple);
  drawCircleButton(110, 50, 25, mediumPurple);
  drawCircleButton(170, 50, 25, darkPurple);

  //Rectangle Buttons Green
  drawRectButton(210, 25, 50, 50, lightGreen);
  drawRectButton(300, 25, 50, 50, mediumGreen);
  drawRectButton(390, 25, 50, 50, darkGreen);

  // Indicator
  stroke(0);
  fill(selectedColor);
  circle(650, 300, 200);
  
  // Drawing box
  noFill();
  stroke(black);
  strokeWeight(2);
  rect(25, 100, 750, 480);
}

//---Draw ends---

// mouse dragged
void mouseDragged() {
  controlSlider();
}

// Function to control slider + shade
void controlSlider() {
  if (mouseX > 100 && mouseX < 700 && mouseY > 285 && mouseY < 315) {  
    sliderX = mouseX;  
  }
}

//Draw function
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
