public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;
  public float scale = 15;
  
  public Walker(){
    // Initialize with random position
    position = new PVector(random(Window.left, Window.right), 
                          random(Window.bottom, Window.top));
    // Initialize with random scale
    scale = random(10, 50);
  }
  
  public void update()
  {
    // Get direction to mouse
    PVector mouse = new PVector(mouseX - Window.windowWidth/2, 
                               -(mouseY - Window.windowHeight/2)); // Convert to camera coordinates
    PVector direction = PVector.sub(mouse, position);
    
    // Normalize the direction
    direction.normalize();
    
    // Assign direction to acceleration and multiply by 0.2
    this.acceleration = direction.mult(0.2);
    
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
  }
  
  public void render()
  {
    circle(position.x, position.y, scale);
  }
  
  public void checkEdges()
  {
   if (this.position.x > Window.right)
   {
     this.position.x = Window.left;
   }
   else if (this.position.x < Window.left)
    {
      this.position.x = Window.right;
    }
    
    if (this.position.y > Window.top)
    {
      this.position.y = Window.bottom;
    }
    else if (this.position.y < Window.bottom)
    {
      this.position.y = Window.top;
    }
  }
}
