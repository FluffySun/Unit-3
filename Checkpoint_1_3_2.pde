// Palette of colors 
color cream = #FCFBE3;
color lightPurple = #D1B3FF;  // Light purple
color mediumPurple = #A385E0; // Medium purple
color darkPurple = #7045A0;   // Dark purple
color white = (255);          // White
color darkOutline = #7045A0;  // Dark outline color
color black = (0);            // Black for pressed button

// Variable for selected color
color selectedColor = mediumPurple;

void setup() {
  size(800, 600);
  strokeWeight(5);
  selectedColor = lightPurple;
}

void draw() {
  background(cream);

  // Buttons using tactile function
  tactile(100, 150, 50, lightPurple);
  fill(lightPurple);
  circle(100, 150, 100);

  tactile(100, 300, 50, mediumPurple);
  fill(mediumPurple);
  circle(100, 300, 100);

  tactile(100, 450, 50, darkPurple);
  fill(darkPurple);
  circle(100, 450, 100);

  // Indicator
  stroke(darkOutline);
  fill(selectedColor);
  square(300, 100, 400);
}

// Tactile function (Hover = White, Click = Black)
void tactile(int x, int y, int r, color outlineColor) {
  if (dist(x, y, mouseX, mouseY) < r) {
    stroke(white);  // Hover effect
  } else {
    stroke(outlineColor);
  }
}

// Mouse Pressed (Turn button outline black when clicked)
void mousePressed() {
  if (dist(100, 150, mouseX, mouseY) < 50) {
    stroke(black);
  }
  if (dist(100, 300, mouseX, mouseY) < 50) {
    stroke(black);
  }
  if (dist(100, 450, mouseX, mouseY) < 50) {
    stroke(black);
  }
}

// Mouse Released (Change selected color)
void mouseReleased() {
  if (dist(100, 150, mouseX, mouseY) < 50) {
    selectedColor = lightPurple;
  } else if (dist(100, 300, mouseX, mouseY) < 50) {
    selectedColor = mediumPurple;
  } else if (dist(100, 450, mouseX, mouseY) < 50) {
    selectedColor = darkPurple;
  }
}
