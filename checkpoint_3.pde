// Palette of colors 
color pink = #FF69B4;        // Pink 
color white = (255);         // White
float sliderX;  // slider circle
float shade;    // Background

void setup() {
  size(800, 600);
  strokeWeight(5);
  sliderX = 400;  // Initial slider position
  shade = 0;      // Initial background 
}

void draw() {
  background(shade);  
  
  // Slider Line (Pink)
  stroke(pink);
  line(100, 300, 700, 300);

  // Slider (Circle)
  fill(pink);
  circle(sliderX, 300, 30);
}

// Mouse Move Slider
void mouseDragged() {
  controlSlider();
}

// Mouse Release
void mouseReleased() {
  controlSlider();
}

// Function slider
void controlSlider() {
  if (mouseX > 100 && mouseX < 700 && mouseY > 285 && mouseY < 315) {
    sliderX = mouseX;  
    shade = map(sliderX, 100, 700, 0, 255);  
  }
}
