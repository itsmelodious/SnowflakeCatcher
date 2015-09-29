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
  background(0);
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
  stroke(255);
  line(mouseX, mouseY, 20, 20);
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
    ellipse(x, y, snowSize, snowSize);
  }
  void lookDown()
  {
    if (y >= 0 && y < 500)
    {
      if (get(x, y + 1) != color(0, 0, 0))
        isMoving = false;
      else
        isMoving = true;
    }
    else
      isMoving = true;
  }
  void erase()
  {
    fill(0);
    ellipse(x, y, snowSize + 1, snowSize + 1);
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
    if (y >= 499)
    {
      x = (int)(Math.random()*500);
      y = 0;
    }
  }
}


