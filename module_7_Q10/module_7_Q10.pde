// Create the ocean 
Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);

// Make an array to hold 10 walkers
Walker[] myWalkers = new Walker[10]; 

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // Create all 10 walkers with different positions
  float totalWidth = Window.right * 2; // Total width of screen
  float spacing = totalWidth / 10; // How far apart to place walkers
  
  // Loop to create all 10 walkers
  for (int i = 0; i < 10; i++) {
    // Make a new walker
    myWalkers[i] = new Walker();
    
    // Put the walker at the right position
    float xPos = Window.left + (spacing * i) + (spacing / 2);
    myWalkers[i].position = new PVector(xPos, 400); // Position above screen
    
    // Give random colors
    myWalkers[i].r = random(0, 255);
    myWalkers[i].g = random(0, 255);
    myWalkers[i].b = random(0, 255);
    
    // Random mass between 1 and 10
    myWalkers[i].mass = random(1, 10);
    
    // Make size depend on mass
    myWalkers[i].scale = myWalkers[i].mass * 10;
  }
}

void draw()
{
   background(255); 
   
   // Draw the ocean
   ocean.render();
   
   // Loop through all walkers
   for (int i = 0; i < 10; i++) {
     // Draw and update the walker
     myWalkers[i].render();
     myWalkers[i].update();
     
     // Add wind force (same for all walkers)
     PVector wind = new PVector(0.1, 0);
     myWalkers[i].applyForce(wind);
     
     // Add gravity (stronger for heavier walkers)
     PVector gravity = new PVector(0, -0.15f * myWalkers[i].mass);
     myWalkers[i].applyForce(gravity);
     
     // Add friction
     float c = 0.1f;
     float normal = 1;
     float frictionMagnitude = c * normal;
     PVector friction = myWalkers[i].velocity.copy();
     
     // Apply friction force
     myWalkers[i].applyForce(friction.mult(-1).normalize().mult(frictionMagnitude));
     
     // Bounce off bottom of screen
     if (myWalkers[i].position.y <= Window.bottom)
     {
       myWalkers[i].position.y = Window.bottom;
       myWalkers[i].velocity.y *= -1;
     }
     
     // Check if in water
     if (ocean.isCollidingWith(myWalkers[i]))
     {
        PVector dragForce = ocean.calculateDragForce(myWalkers[i]);
        myWalkers[i].applyForce(dragForce);
     }
   }
}
