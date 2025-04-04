int frameCount = 0; // Track frame count for screen flushing

void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
}

void draw()
{
  // X coordinate using Gaussian distribution
  float gaussianX = randomGaussian();
  float standardDeviationX = 500;
  float meanX = 0;
  float x = standardDeviationX * gaussianX + meanX;
  
  // Y coordinate using random() between top and bottom of screen
  float y = random(-height/2, height/2);
  
  // Circle size using Gaussian with different parameters
  float gaussianSize = randomGaussian();
  float standardDeviationSize = 20;
  float meanSize = 30;
  float circleSize = standardDeviationSize * gaussianSize + meanSize;
  circleSize = max(5, circleSize);
  
  // Random colors with alpha between 10-100
  float r = random(255);
  float g = random(255);
  float b = random(255);
  float alpha = random(10, 100);
  
  noStroke();
  fill(r, g, b, alpha);
  circle(x, y, circleSize);
  
  // Flush screen
  frameCount++;
  if(frameCount >= 300) {
    background(0);
    frameCount = 0;
  }
}
