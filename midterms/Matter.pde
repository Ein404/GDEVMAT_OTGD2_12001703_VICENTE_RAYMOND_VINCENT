public class Matter extends Mover {
  float speed;
  
  Matter() {
    // Position using Gaussian distribution
    float x = randomGaussian() * (Window.windowWidth/2.5);
    float y = randomGaussian() * (Window.windowHeight/2.5);
    position = new PVector(x, y);
    
    // Random scale
    this.scale = random(5, 30);
    
    // Random speed
    this.speed = random(0.5, 3.0);
    
    // Random colors
    setRandomColor();
  }
  
  void setRandomColor() {
    float r = random(50, 255);
    float g = random(50, 255);
    float b = random(50, 255);
    setColor(r, g, b, 200);
  }
}
