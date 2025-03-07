//PAINT APP
//Ema (Anyue) Sun
//Unit 4 Project

// Define Color Palette
color pink1 = #fdc5f5; // Light Pink
color pink2 = #ffc8dd; // Soft Pink
color pink3 = #ffafcc; // Peach Pink
color brown = #c9184a; // Brown Red
color blue1 = #bde0fe; // Light Blue
color blue2 = #a2d2ff; // Soft Blue

// Define Variables
float sliderX;  
float shade;
color selectedColor; // Variable for selected drawing color
float strokeThickness; // Thickness of the brush

void setup() {
  size(1000, 800);
  strokeWeight(5);        
  sliderX = 400; // Initial slider position
  shade = 0; // Initial shade
  selectedColor = pink1; // Default color
  strokeThickness = 5; // Default stroke thickness
}

void draw() {
  // Map slider to stroke thickness
  strokeThickness = map(sliderX, 100, 400, 2, 20);  
  background(shade);
  
  // Draw Slider
  drawSlider();

  // Draw Color Buttons
  drawColorButtons();

  // Indicator - Reflects Selected Color & Thickness
  stroke(0);
  fill(selectedColor);
  ellipse(600, 150, strokeThickness * 3, strokeThickness * 3);
}

// Function: Draws the Tactile Slider
void drawSlider() {
  // Slider Line (Tactile Hover Effect)
  tactileRect(100, 285, 300, 30, brown);
  stroke(brown);
  line(100, 300, 400, 300);

  // Slider Circle (Tactile Hover Effect)
  tactileCircle((int)sliderX, 300, 30, pink);
  fill(pink1);
  noStroke();
  circle(sliderX, 300, 30);
}

// Function: Draws Color Buttons
void drawColorButtons() {
  // Color Buttons with Tactile Effect
  tactileCircle(100, 150, 40, pink1);
  fill(pink1);
  circle(100, 150, 50);
  
  tactileCircle(200, 150, 40, pink2);
  fill(pink2);
  circle(200, 150, 50);
  
  tactileCircle(300, 150, 40, pink3);
  fill(pink3);
  circle(300, 150, 50);
  
  tactileCircle(400, 150, 40, brown);
  fill(brown);
  circle(400, 150, 50);
  
  tactileCircle(500, 150, 40, blue1);
  fill(blue1);
  circle(500, 150, 50);
  
  tactileCircle(600, 150, 40, blue2);
  fill(blue2);
  circle(600, 150, 50);
}

// Function: Changes color when clicking a button
void mouseReleased() {
  controlSlider();
  
  if (dist(100, 150, mouseX, mouseY) < 40) selectedColor = pink1;
  if (dist(200, 150, mouseX, mouseY) < 40) selectedColor = pink2;
  if (dist(300, 150, mouseX, mouseY) < 40) selectedColor = pink3;
  if (dist(400, 150, mouseX, mouseY) < 40) selectedColor = brown;
  if (dist(500, 150, mouseX, mouseY) < 40) selectedColor = blue1;
  if (dist(600, 150, mouseX, mouseY) < 40) selectedColor = blue2;
}

// Function: Controls Slider Movement
void controlSlider() {
  if (mouseX > 100 && mouseX < 400 && mouseY > 285 && mouseY < 315) {  
    sliderX = mouseX;  
  }
}

// Function: Tactile Effect for Rectangles
void tactileRect(int x, int y, int w, int h, color outlineColor) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    stroke(white);  
  } else {
    stroke(outlineColor);  
  }
}

// Function: Tactile Effect for Circles
void tactileCircle(int x, int y, int r, color outlineColor) {
  if (dist(x, y, mouseX, mouseY) < r) {
    stroke(white);  
  } else {
    stroke(outlineColor);
  }
}

// Function: Enables Smooth Dragging of Slider
void mouseDragged() {
  controlSlider();
}
