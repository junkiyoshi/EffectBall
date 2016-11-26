class EffectLines
{
  PVector centerPoint;
  float radius;
  float noise1, noise2;
  
  EffectLines(float r)
  {
    centerPoint = new PVector(width / 2, height / 2);
    radius = r;
    
    noise1 = random(10);
    noise2 = random(10);
}
  
  void drawMe(color strokeColor)
  {
    noiseDetail(5,0.3);
    
    float x, y;
    float tmp_noise2 = noise2;
    pushMatrix();
    translate(centerPoint.x, centerPoint.y);
    
    for(float i = 0; i < 360; i+= 0.5)
    {
      noise2 += 0.03;
      
      x = (noise(noise1, noise2) * radius) * cos(radians(i));
      y = (noise(noise1, noise2) * radius) * sin(radians(i));
      
      float x2 = (radius / 3) * cos(radians(i));
      float y2 = (radius / 3) * sin(radians(i));
      
      float dist1 = dist(0, 0, x, y);
      float dist2 = dist(0, 0, x2, y2);
      
      if(dist2 > dist1)
      {
        x = x2;
        y = y2;
      }
                       
      stroke(strokeColor);
      strokeWeight(1);
      point(x, y);
    }
    
    noise1 += 0.03;
    noise2 = tmp_noise2;
    
    popMatrix();
  }
}