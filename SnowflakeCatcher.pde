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
  int x, y, snowSize;
  boolean isMoving;
  Snowflake()
  {
    x = (int)(Math.random()*501);
    y = (int)(Math.random()*501);
    snowSize = (int)(Math.random()*6)+2;
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
    // need to make speed random
    int snowSpeed;
    int randSpeed = (int)(Math.random()*1);
      if (randSpeed == 0)
        snowSpeed = 1;
      else if(randSpeed ==1)
        snowSpeed = 2;
      else
        snowSpeed = 1;
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


