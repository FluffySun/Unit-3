//palette of colors 
color cream = #FCFBE3;
color lightPurple = #D1B3FF;  // Light purple
color mediumPurple = #A385E0; // Medium purple
color darkPurple = #7045A0;   // Dark purple
color white= (255); //white

//variables for color selection
color selectedColor= #A385E0;

void setup() {
  size(800, 600);
  strokeWeight(5);
  stroke(darkPurple);
  selectedColor=lightPurple;
}//setup end===

void draw() {
  background(cream);
 
  // Indicator
  stroke(darkPurple);
  fill(selectedColor);
  square(300, 100, 400);

  // buttons
  if (dist(100, 150,mouseX, mouseY) < 50) {
  stroke(white);
  }else{
  stroke(darkPurple);
  }
  fill(lightPurple);
  circle(100, 150, 100);
  
  if (dist(100,300,mouseX, mouseY) < 50) {
  stroke(white);
  }else{
  stroke(darkPurple);
  }
  fill(mediumPurple);
  circle(100, 300, 100);

  if (dist(100,450,mouseX, mouseY) < 50) {
  stroke(white);
  }else{
  stroke(darkPurple);
  }
  fill(darkPurple);
  circle(100, 450, 100);
}//end of draw==========

void mouseReleased() {
  //lightPurple
  if (dist(100, 150,mouseX, mouseY) < 50) {
    selectedColor=lightPurple;
  } 
  //mediumPurple
  if (dist(100,300,mouseX, mouseY) < 50) {
    selectedColor=mediumPurple;
  } 
  //darkPurple
  if (dist(100,450,mouseX, mouseY) < 50) {
    selectedColor=darkPurple;
  }
}
