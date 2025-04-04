Walker[] spaceObjects = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // Create all 10 walkers with random properties
  for (int i = 0; i < 10; i++) 
  {
    // Make a new walker
    spaceObjects[i] = new Walker();
    
    // Give random colors
    spaceObjects[i].r = random(0, 255); // random red
    spaceObjects[i].g = random(0, 255); // random green
    spaceObjects[i].b = random(0, 255); // random blue
    
    // Give random mass between 5 and 15
    spaceObjects[i].mass = random(5, 15);
    
    // Set scale based on mass
    spaceObjects[i].scale = spaceObjects[i].mass * 10;
    
    // Put in random position
    float randX = random(Window.left, Window.right);
    float randY = random(Window.bottom, Window.top);
    spaceObjects[i].position = new PVector(randX, randY);
  }
}

void draw()
{
   // Clear the background
   background(255); 
   
   // First loop - for each walker
   for (int i = 0; i < 10; i++)
   {
     // Update and draw each walker
     spaceObjects[i].update();
     spaceObjects[i].render();
     
     // Second loop - calculate attraction to every other walker
     for (int j = 0; j < 10; j++)
     {
       // Don't calculate attraction to itself!
       if (i != j)
       {
         // Calculate and apply attraction force
         PVector force = spaceObjects[j].calculateAttraction(spaceObjects[i]);
         spaceObjects[i].applyForce(force);
       }
     }
   }
}
