// Define Color Palette
color pink = #FF69B4;// Pink
color white = 255;// White

// Define Variables
float sliderX;  
float shade;

void setup() {
  size(800, 600);         
  strokeWeight(5);        
  sliderX = 400;//initial slider
  shade = 0;//initial shade
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
}

// mouse dragged
void mouseDragged() {
  controlSlider();
}

// mouse released
void mouseReleased() {
  controlSlider();
}

// Function to control slider + shade
void controlSlider() {
  if (mouseX > 100 && mouseX < 700 && mouseY > 285 && mouseY < 315) {  
    sliderX = mouseX;  
}
}
