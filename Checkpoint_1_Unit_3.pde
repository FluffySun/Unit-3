// color 
color cream = #FCFBE3;
color lightPurple = #D1B3FF;  // Light purple
color mediumPurple = #A385E0; // Medium purple
color darkPurple = #7045A0;   // Dark purple
color selectedColor; 

void setup() {
  size(800, 600);
  strokeWeight(5);
  stroke(darkPurple);
  selectedColor = mediumPurple; 
}

void draw() {
  background(cream);

  // Indicator
  fill(selectedColor);
  rect(300, 100, 400, 300);

  // Draw button
  fill(lightPurple);
  circle(100, 150, 100);

  fill(mediumPurple);
  circle(100, 300, 100);

  fill(darkPurple);
  circle(100, 450, 100);
}

void mouseReleased() {
  if (dist(mouseX, mouseY, 100, 150) < 50) {
    selectedColor = lightPurple;
  } 
  else if (dist(mouseX, mouseY, 100, 300) < 50) {
    selectedColor = mediumPurple;
  } 
  else if (dist(mouseX, mouseY, 100, 450) < 50) {
    selectedColor = darkPurple;
  }
}
