// Palette of colors 
color cream = #F0F8E0; 
color lightGreen = #B2D8B2;  // Light green
color mediumGreen = #66A366; // Medium green
color darkGreen = #2D5E2D;   // Dark green
color white = (255);         // White
color darkOutline = #1F3D1F; // Dark green line
color black = (0);           // Black

// Variable for selected color
color selectedColor = mediumGreen;

void setup() {
  size(800, 600);
  strokeWeight(5);
  selectedColor = lightGreen;
}

void draw() {
  background(cream);

  // Buttons Tactile
  tactile(50, 100, 200, 100, lightGreen);
  fill(lightGreen);
  rect(50, 100, 200, 100);

  tactile(50, 250, 200, 100, mediumGreen);
  fill(mediumGreen);
  rect(50, 250, 200, 100);

  tactile(50, 400, 200, 100, darkGreen);
  fill(darkGreen);
  rect(50, 400, 200, 100);

  // Indicator 
  stroke(darkOutline);
  fill(selectedColor);
  circle(500, 300, 200);
}

// Tactile
void tactile(int x, int y, int w, int h, color outlineColor) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    stroke(white);  
  } else {
    stroke(outlineColor);  // Default outline
  }
}

// Mouse Release (Change selected color)
void mouseReleased() {
  if (mouseX > 50 && mouseX < 250 && mouseY > 100 && mouseY < 200) {
    selectedColor = lightGreen;
  } 
  if (mouseX > 50 && mouseX < 250 && mouseY > 250 && mouseY < 350) {
    selectedColor = mediumGreen;
  } 
  if (mouseX > 50 && mouseX < 250 && mouseY > 400 && mouseY < 500) {
    selectedColor = darkGreen;
  }
}
