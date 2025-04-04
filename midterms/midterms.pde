// Global variables
BlackHole blackHole;
Matter[] matters;
int frameCount = 0;
int resetFrames = 300; // Reset after 300 frames

void setup()
{
  size(1920, 1080, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // Initialize simulation
  resetSimulation();
}

void resetSimulation() {
  // Create black hole at random position
  float x = random(Window.left, Window.right);
  float y = random(Window.bottom, Window.top);
  blackHole = new BlackHole(x, y);
  
  // Create matter using Gaussian distribution
  int matterCount = 100; // Minimum required
  matters = new Matter[matterCount];
  for (int i = 0; i < matterCount; i++) {
    matters[i] = new Matter();
  }
  
  frameCount = 0;
}

void draw()
{
  background(0);
  
  // BONUS: Make the black hole follow your mouse cursor
  PVector mousePos = new PVector(
    map(mouseX, 0, width, Window.left, Window.right),
    map(mouseY, 0, height, Window.top, Window.bottom)
  );
  blackHole.position = mousePos;
  
  // Render black hole
  blackHole.render();
  
  // Update and render matter
  for (Matter m : matters) {
    // Calculate direction towards black hole using static method
    PVector direction = PVector.sub(blackHole.position, m.position);
    
    // Normalize direction (make it unit length)
    direction.normalize();
    
    // Scale by speed
    direction.mult(m.speed);
    
    // Move matter towards black hole
    m.position.add(direction);
    
    // Render matter
    m.render();
  }
  
  // Count frames and reset if needed
  frameCount++;
  if (frameCount >= resetFrames) {
    resetSimulation();
  }
}
