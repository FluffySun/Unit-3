// Define Color Palette
color pink = #FF69B4;//Pink
color white = 255; //White

// Define Variables
float sliderX;  //Slider position
float shade;    //Background

void setup() {
  size(800, 600);         
  strokeWeight(5);        
  sliderX = 400;//slider position
  shade = 0;
}

void draw() {
  background(shade);
  
  // Slider Line
  stroke(pink);
  line(100, 300, 700, 300);

  // Slider Circle
  fill(pink);
  noStroke();
  circle(sliderX, 300, 30);
}

//When mouse drag
void mouseDragged() {
  controlSlider();
}

//When Mouse release
void mouseReleased() {
  controlSlider();
}

// Function control slider move
void controlSlider() {
  if (mouseX > 100 && mouseX < 700 && mouseY > 285 && mouseY < 315) {  
    sliderX = mouseX;  
    shade = map(sliderX, 100, 700, 0, 255);  // Map slider position to background shade
  }
}
