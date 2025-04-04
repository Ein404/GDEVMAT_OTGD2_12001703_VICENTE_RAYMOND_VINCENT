void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.widthPx / 2;
  float y = -(mouseY - Window.heightPx / 2);
  return new PVector(x, y);
}

void draw()
{
  background(130);
  
  PVector mouse = mousePos();
  
  // Normalize and set blade length
  PVector direction = mouse.copy().normalize().mult(400);
  // Create opposite direction for double-sided effect
  PVector oppositeDirection = direction.copy().mult(-1);
  
  // Calculate handle length (centered on origin)
  float handleLength = 120;
  PVector handleStart = direction.copy().normalize().mult(-handleLength/2);
  PVector handleEnd = direction.copy().normalize().mult(handleLength/2);
  
  // Draw red outer glow (high thickness) for both sides
  strokeWeight(15);
  stroke(255, 0, 0, 200);
  line(handleEnd.x, handleEnd.y, direction.x, direction.y);
  line(handleStart.x, handleStart.y, oppositeDirection.x, oppositeDirection.y);
  
  // Draw white inner glow (low thickness) for both sides
  strokeWeight(5);
  stroke(255, 255, 255, 220);
  line(handleEnd.x, handleEnd.y, direction.x, direction.y);
  line(handleStart.x, handleStart.y, oppositeDirection.x, oppositeDirection.y);
  
  // Draw black handle (mid thickness) in the middle
  strokeWeight(10);
  stroke(0);
  line(handleStart.x, handleStart.y, handleEnd.x, handleEnd.y);
  
  // Print magnitude of one side of the lightsaber
  println("Lightsaber blade magnitude: " + (direction.mag() - handleLength/2));
}
