int startX = 400;
int startY = 100;
int endX = 300;
int endY = 500;
int w = 30;
int diameter = 600;
int bx = 0;
int by = 900;

void setup()
{
  size(800, 800);
  background(20, 40, 100);
  noStroke();
  frameRate(20);
}
void draw()
{
  // lightning
  stroke(250 - (int)(Math.random()*100), 150, 200);
  //fill(0, 0, 0, 0);
  while (endY < 800)
  {
    endY = startY + (int)(Math.random()*9);
    endX = startX + (int)(Math.random()*19) - 9;
    line(startX, startY, endX, endY);
    startX = endX;
    startY = endY;
    strokeWeight(w);
    w = w - (int)(Math.random()*2);
    if (w < 0)
    {
      w = 1;
    }
  }
  drawJellyfish();
}
void mousePressed()
{
  startX = 400;
  startY = 100;
  endX = 400;
  endY = 0;
  w = 30;
  diameter = 600;
}

void drawJellyfish() {
  //jellyfish
  noStroke();
  int domeW = 250;
  int domeH = 200;
  int centerX = width/2;
  int centerY = 150;

  for (int y = 0; y < domeH/2; y++) {
    float inter = map(y, 0, domeH/2, 0, 1);
    int c = lerpColor(color(255, 180, 220), color(120, 180, 255), inter);
    fill(c);
    arc(centerX, centerY, domeW, domeH - y, PI, TWO_PI);
  }

  fill(120, 180, 255);
  for (int i = -100; i <= 100; i += 40) {
    ellipse(centerX + i, centerY, 60, 35);
  }

  for (int i = -80; i <= 80; i += 30) {
    fill(255, 255, 255, 40);
    arc(405 + i, centerY, 40, 160, PI, TWO_PI);
  }

  fill(255, 220);
  ellipse(centerX - 50, 85, 70, 40);
  strokeWeight(3);
}

void drawBubble(float bx, float by, float r) {
  noStroke();

  for (int i = int(r); i > 0; i--) {
    float alpha = map(i, 0, r, 0, 180);
    float inter = map(i, 0, r, 0, 1);

    int c = lerpColor(color(100, 180, 255, alpha), color(80, 80, 255, alpha), inter);
    fill(c);
    ellipse(bx, by, i, i);
  }

  stroke(200, 220, 255, 200);
  strokeWeight(2);
  noFill();
  ellipse(bx, by, r, r);

  noStroke();
  fill(255, 255, 255, 180);
  ellipse(bx - r*0.25, by - r*0.25, r*0.25, r*0.15);
}
