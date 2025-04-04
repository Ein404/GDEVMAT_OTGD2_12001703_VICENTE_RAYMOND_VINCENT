public class Walker
{
  public float x;
  public float y;
  public float tx = 0, ty = 10000;
  
  // New variables for circle size/thickness with perlin noise
  public float size;
  public float ts = 20000;
  
  public float r, g, b;
  public float tr = 30000, tg = 40000, tb = 50000;
  
  void render()
  {
    fill(r, g, b);
    circle(x, y, size);
  }
  
  void perlinWalk()
  {
    // Original position calculations
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);
    
    // New calculation for size using Perlin noise
    size = map(noise(ts), 0, 1, 5, 150);
    
    // New calculations for RGB values using Perlin noise
    r = map(noise(tr), 0, 1, 0, 255);
    g = map(noise(tg), 0, 1, 0, 255);
    b = map(noise(tb), 0, 1, 0, 255);
    
    // Increment all time variables
    tx += 0.01f;
    ty += 0.01f;
    ts += 0.01f; // For size
    tr += 0.01f; // For red
    tg += 0.01f; // For green
    tb += 0.01f; // For blue
  }
}
