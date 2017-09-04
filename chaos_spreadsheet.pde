double k;
double x0;
int step;
double h;

PFont f;

void draw_graph() {
  double scale = height / h;

  double x = x0;
  double nx = k * x * (1 - x);

  for (int i = 0; i < width; i += step) {
    line(i, (float) (x * scale), (float) (i + step), (float) (nx * scale));
    x = nx;
    nx = k * x * (1 - x);
  }
}

boolean cycle;
double cyclespeed;

void setup() {
  size(1800, 900);
  f = createFont("courier", 20, true);
  cycle = true;
  cyclespeed = 0.01;
  x0 = 0.5;
  k = 0;
  step = 40;
  h = 1;
}

void draw() {
  background(0);
  stroke(255);
  draw_graph();
  
  textFont(f);
  text("k:" + k, 50, 50);
  text("step: " + step, 50, 100);
  text("slo mo: " + 0.01 / cyclespeed, 50, 150);
  text("step: " + step, 50, 200);
  text("x0: " + x0, 50, 250);
  
  if (cyclespeed + 1 == 1) {
    text("TOO SMALL DELTA", 50, 250);
  }
  
  if (cycle) {
    k += cyclespeed;
    if (k > 4.02) {
      k = 0;
    }
  }
}

void keyPressed() {
  switch(keyCode) {
  case UP:
    k += 0.1;
    break;
  case DOWN:
    k -= 0.1;
    break;
    
  case 'W':
    h += 0.1;
    break;
  case 'S':
    h -= 0.1;
    break;
    
  case 'A':
    step--;
    if (step < 1) {
      step = 1;
    }
    break;
  case 'D':
    step++;
    break;
    
  case 'I':
    k = 3.7;
    cyclespeed = 0.000001;
    step = 40;
    break;
    
  case '0':
    x0 += 0.05;
    break;
  case '9':
    x0 -= 0.05;
    
  case 'F':
    cycle = !cycle;
    break;
  case 'G':
    cyclespeed = 0.01;
    break;
  case 'H':
    cyclespeed = 0.0001;
    break;
  case 'J':
    cyclespeed = 0.000001;
    break;
    
  case LEFT:
    cyclespeed /= 10;
    break;
  case RIGHT:
    cyclespeed *= 10;
    break;
    
  case 'R':
    setup();
    break;
  }
}
