Snowflake [] s;
void setup()
{
  size(500, 500);
  background(0);
  s = new Snowflake[100];
  for (int i = 0; i < s.length; i++)
  {
    s[i] = new Snowflake();
  }
}
void draw()
{
  for (int i = 0; i < s.length; i++)
  {
    s[i].erase();
    s[i].lookDown();
    s[i].move();
    s[i].wrap();
    s[i].show();
  }
}
void mouseDragged()
{
  strokeWeight(10);
  stroke(255);
  line(mouseX, mouseY, pmouseX, pmouseY);
}
void keyPressed()
{
  if (key == 'a')
    background(0);
}

class Snowflake
{
  int x, y, snowSize, snowSpeed;
  boolean isMoving;
  Snowflake()
  {
    x = (int)(Math.random()*501);
    y = (int)(Math.random()*501);
    snowSize = (int)(Math.random()*6)+2;
    snowSpeed = (int)(Math.random()*3)+1;
    isMoving = true;
  }
  void show()
  {
    fill(255);
    noStroke();
    ellipse(x, y, snowSize, snowSize);
  }
  void lookDown()
  {
    if (y >= 0 && y < 500 - (snowSize) && get(x, y + (snowSize)) != color(0, 0, 0))
    {
        isMoving = false;
    }
    else
      isMoving = true;
  }
  void erase()
  {
    fill(0);
    noStroke();
    ellipse(x, y, snowSize + 3, snowSize + 3);
  }
  void move()
  {
    if (isMoving == true)
    {
      y = y + snowSpeed;
    }
  }
  void wrap()
  {
    if (y >= 500)
    {
      x = (int)(Math.random()*500);
      y = 0;
    }
  }
}


