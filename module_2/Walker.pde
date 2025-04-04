class Walker
{
  float x;
  float y;
  float r, g, b, a;  // Color components
  
  Walker()
  {
    x = width/2;
    y = height/2;
    updateColor();  // Initialize color
  }
  
  void updateColor()
  {
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
    a = random(50, 100);  // Alpha between 50 and 100
  }
  
  void render()
  {
    fill(r, g, b, a);
    circle(x, y, 30);
    updateColor();  // Change color every frame
  }
  
  void randomWalk()
  {
    int rng = int(random(8));  // Modified for 8 directions
    
    if (rng == 0)
    {
      y+=10;  // Down
    }
    else if (rng == 1)
    {
      y-=10;  // Up
    }
    else if (rng == 2)
    {
      x+=10;  // Right
    }
    else if (rng == 3)
    {
      x-=10;  // Left
    }
    else if (rng == 4)
    {
      x+=10;  // Diagonal: Up-Right
      y-=10;
    }
    else if (rng == 5)
    {
      x-=10;  // Diagonal: Up-Left
      y-=10;
    }
    else if (rng == 6)
    {
      x+=10;  // Diagonal: Down-Right
      y+=10;
    }
    else if (rng == 7)
    {
      x-=10;  // Diagonal: Down-Left
      y+=10;
    }
  }
  
  void randomWalkBiased()
  {
    float chance = random(1);  // Random value between 0 and 1
    
    // Example: 40% right, 20% left, 20% up, 20% down
    if (chance < 0.4)
    {
      x+=10;  // 40% chance to go right
    }
    else if (chance < 0.6)
    {
      x-=10;  // 20% chance to go left
    }
    else if (chance < 0.8)
    {
      y-=10;  // 20% chance to go up
    }
    else
    {
      y+=10;  // 20% chance to go down
    }
  }
}
