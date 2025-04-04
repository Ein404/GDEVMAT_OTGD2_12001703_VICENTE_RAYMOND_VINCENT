// Global variables for sine wave
float amplitude = 50;
float frequency = 0.1;
float phase = 0;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2) / tan(PI*30 / 180), 0, 0, 0, 0, -1, 0);
}

void draw()
{
  background(0);
  
  drawCartesianPlane();
  // drawLinearFunction();
  // drawQuadraticFunction();
  // drawCircle();
  drawQuadraticFunction2();
  drawLinearFunction2();
  drawSineWave();
}

void drawCartesianPlane()
{
  strokeWeight(2);
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  line(300, 0, -300, 0);
  line(0, -300, 0, 300);
  
  for (int i = -300; i <= 300; i += 10)
  {
    line(i, -2, i, 2);
    line(-2, i, 2, i);
  }
}

void drawLinearFunction()
{
 color red = color(255, 0, 0);
 fill(red);
 noStroke();
 
 for (int x = -200; x <= 200; x++)
 {
   circle(x, x + 2, 5);
 }
}

void drawQuadraticFunction()
{
  color green = color(0, 255, 0);
  fill(green);
  stroke(green);
  
  for (float x = -300; x <= 300; x += 0.1f)
  {
    circle(x * 10, (float)Math.pow(x, 2) + (2 * x) - 5, 5);
  }
}

void drawCircle()
{
  color blue = color(0, 0, 255);
  fill(blue);
  stroke(blue);
  float radius = 50;
  
  for (float x = 0; x <= 360; x ++)
  {
    circle((float)Math.cos(x) * radius, (float)Math.sin(x) * radius, 5);
  }
}

void drawQuadraticFunction2()
{
  color yellow = color(255, 255, 0);
  fill(yellow);
  stroke(yellow);
  
  for (float x = -30; x <= 30; x += 0.1f)
  {
    float y = (float)Math.pow(x, 2) - (15 * x) - 3;
    circle(x * 10, y, 5);
  }
}

void drawLinearFunction2()
{
  color purple = color(128, 0, 128);
  fill(purple);
  noStroke();
  
  for (int x = -200; x <= 200; x++)
  {
    float y = (-5 * (x/10.0)) + 30;
    circle(x, y, 5);
  }
}

void drawSineWave()
{
  color sineColor = color(0, 128, 255); // Using blue color
  fill(sineColor);
  stroke(sineColor);
  
  for (float x = -300; x <= 300; x += 1)
  {
    float y = amplitude * sin(frequency * (x/10.0) + phase);
    circle(x, y, 5);
  }
  
  // Update phase for animation
  phase += 0.05;
}

void keyPressed()
{
  // Increase/decrease amplitude with UP and DOWN arrows
  if (keyCode == UP) amplitude += 5;
  if (keyCode == DOWN && amplitude > 5) amplitude -= 5;
  
  // Increase/decrease frequency with RIGHT and LEFT arrows
  if (keyCode == RIGHT) frequency += 0.01;
  if (keyCode == LEFT && frequency > 0.01) frequency -= 0.01;
}
