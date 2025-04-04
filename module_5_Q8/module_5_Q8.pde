// Create array of 10 walkers
Walker[] walkers = new Walker[10];

// Define forces
PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // Initialize 10 walkers with properties
  for (int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker();
    // Set random mass between 1 and 10
    walkers[i].mass = random(1, 10);
    // Set scale based on mass
    walkers[i].scale = walkers[i].mass * 15;
    // Set random color
    walkers[i].r = random(0, 255);
    walkers[i].g = random(0, 255);
    walkers[i].b = random(0, 255);
    // Set starting position
    walkers[i].position = new PVector(-500, 200);
  }
}

void draw()
{
  background(80);
  
  // Update and render all walkers
  for (int i = 0; i < walkers.length; i++) {
    // Apply forces
    walkers[i].applyForce(wind);
    walkers[i].applyForce(gravity);
    
    // Update and render
    walkers[i].update();
    walkers[i].render();
    
    // Check boundaries and bounce (Newton's Third Law)
    // Bottom edge
    if (walkers[i].position.y <= Window.bottom) {
      walkers[i].position.y = Window.bottom;
      walkers[i].velocity.y *= -1;
    }
    
    // Top edge
    if (walkers[i].position.y >= Window.top) {
      walkers[i].position.y = Window.top;
      walkers[i].velocity.y *= -1;
    }
    
    // Left edge
    if (walkers[i].position.x <= Window.left) {
      walkers[i].position.x = Window.left;
      walkers[i].velocity.x *= -1;
    }
    
    // Right edge
    if (walkers[i].position.x >= Window.right) {
      walkers[i].position.x = Window.right;
      walkers[i].velocity.x *= -1;
    }
  }
}
