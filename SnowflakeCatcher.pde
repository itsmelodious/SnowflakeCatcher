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
  //your code here
}

class Snowflake
{
  int x, y;
  boolean isMoving;
  Snowflake()
  {
    x = (int)(Math.random()*500);
    y = (int)(Math.random()*500);
    isMoving = true;
  }
  void show()
  {
    fill(255);
    ellipse(x, y, 5, 5);
  }
  void lookDown()
  {
    if (y >= 0 || y <= 500)
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
    ellipse(x, y, 7, 7);
  }
  void move()
  {
    if (isMoving == true)
    {
      y++;
    }
  }
  void wrap()
  {
    if (y > 500 || y < 0)
    {
      x = (int)(Math.random()*500);
      y = 0;
    }
  }
}


