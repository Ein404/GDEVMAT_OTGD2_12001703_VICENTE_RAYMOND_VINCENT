public class Walker
{
  // Converted to use PVector for position
  public PVector position = new PVector();
  public PVector speed = new PVector(5, 8); // For moveAndBounce function
  
  public float tx = 0, ty = 10000;
  
  // Variables for circle size/thickness with perlin noise
  public float size;
  public float ts = 20000;
  
  public float r, g, b;
  public float tr = 30000, tg = 40000, tb = 50000;
  
  void render()
  {
    fill(r, g, b);
    circle(position.x, position.y, size);
  }
  
  void perlinWalk()
  {
    // Updated position calculations using PVector
    position.x = map(noise(tx), 0, 1, -640, 640);
    position.y = map(noise(ty), 0, 1, -360, 360);
    
    // Size using Perlin noise
    size = map(noise(ts), 0, 1, 5, 150);
    
    // RGB values using Perlin noise
    r = map(noise(tr), 0, 1, 0, 255);
    g = map(noise(tg), 0, 1, 0, 255);
    b = map(noise(tb), 0, 1, 0, 255);
    
    // Increment all time variables
    tx += 0.01f;
    ty += 0.01f;
    ts += 0.01f;
    tr += 0.01f;
    tg += 0.01f;
    tb += 0.01f;
  }
  
  // New moveAndBounce function to simulate the bouncing ball behavior
  void moveAndBounce()
  {
    // Update position based on speed
    position.add(speed);
    
    // Bounce off walls
    if ((position.x > Window.right) || (position.x < Window.left))
    {
      speed.x *= -1;
    }
    
    if ((position.y > Window.top) || (position.y < Window.bottom))
    {
      speed.y *= -1;
    }
    
    // Update size and color with Perlin noise
    size = map(noise(ts), 0, 1, 5, 150);
    r = map(noise(tr), 0, 1, 0, 255);
    g = map(noise(tg), 0, 1, 0, 255);
    b = map(noise(tb), 0, 1, 0, 255);
    
    // Increment time variables for Perlin noise
    ts += 0.01f;
    tr += 0.01f;
    tg += 0.01f;
    tb += 0.01f;
  }
}
