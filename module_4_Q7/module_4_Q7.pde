// Create array of 100 walkers
Walker[] walkers = new Walker[100];

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // Initialize 100 walkers with random positions and scales
  for (int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker();
  }
}

void draw()
{
 background(80);
 
 // Update, render and check edges for all walkers
 for (int i = 0; i < walkers.length; i++) {
   walkers[i].update();
   walkers[i].render();
   walkers[i].checkEdges();
 }
}
