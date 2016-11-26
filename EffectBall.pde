EffectLines[] lines;
color c;
float cValue;

void setup()
{
  size(1280, 720);
  smooth();
  background(0);
  frameRate(30);
  
  // blendMode(ADD);
  
  lines = new EffectLines[8];
  for(int i = 0; i < lines.length; i++)
  {
    lines[i] = new EffectLines(680);
  }
  
  c = color(255, 0, 0);
  cValue = 1;
}

void draw()
{  
  fill(0, 32);
  noStroke();
  rect(0, 0, width, height);
 
  
  for(int i = 0; i < lines.length; i++)
  {
    lines[i].drawMe(c);
  }
  
  if(frameCount % 300 == 0)
  {    
    if(cValue == 0)
    {
      c = color(255, 0, 0);
    }
    if(cValue == 1)
    {
      c = color(255, 255, 0);
    }
    if(cValue == 2)
    {
      c = color(0, 255, 0);
    }
    if(cValue == 3)
    {
      c = color(0, 255, 255);
    }
    if(cValue == 4)
    {
      c = color(0, 0, 255);
    }
    if(cValue == 5)
    {
      c = color(255, 0, 255);
    }
    
    cValue = (cValue + 1) % 6;
  }
  
  //saveFrame("screen-#####.png");
  
  if(frameCount > 1800)
  {
    exit();
  }
  
}