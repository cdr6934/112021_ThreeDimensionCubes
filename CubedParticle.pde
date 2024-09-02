class CubedParticle
{
  float x, y, z, rotate, dim, move; 
  color c; 
  CubedParticle(float _x, float _y, float _z, float _dim, color _c)
  {
    x = _x; 
    y = _y; 
    z = _z; 
    dim = _dim; 
    c = _c; 
    move = random(0.2);
  }
  
  void update()
  {
    rotate = TWO_PI + (frameCount*move);
    dim = 5 +  dim/2 * sin(frameCount * move); 
  }
  
  void draw()
  {
    fill(c); 
    pushMatrix(); 
    translate(x,y,z); 
    rotateX(rotate); 
    //rotateX(rotate/2); 
    box(dim,dim,dim*10); 
    popMatrix(); 
    
  }
}
