class Particle {
  float x, y;
  color c;
  float angle;
  float speed;
  float lifespan;

  Particle(float centerX, float centerY) {
    x = centerX;
    y = centerY;
    c = color(random(255), random(255), random(255), 255);
    angle = random(TWO_PI);
    speed = random(2, 5);
    lifespan = 255;
  }

  void move() {
    x += cos(angle) * speed;
    y += sin(angle) * speed;
    lifespan -= 3;
    if (lifespan < 0) lifespan = 0;
  }

  void show() {
    fill(c, lifespan);
    noStroke();
    ellipse(x, y, 10, 10);
  }
}

class OddballParticle extends Particle {
  OddballParticle(float centerX, float centerY) {
    super(centerX, centerY);
    c = color(255, 0, 0, 255);
  }

  @Override
  void move() {
    x += random(-5, 5);
    y += random(-5, 5);
  }

  @Override
  void show() {
    fill(c, lifespan);
    noStroke();
    ellipse(x, y, 20, 20);
  }
}

Particle[] particles;
int numParticles = 300;

void setup() {
  size(800, 600);
  initializeParticles();
}

void draw() {
  fill(0, 20);
  rect(0, 0, width, height);
  
  for (Particle p : particles) {
    p.move();
    p.show();
  }
}

void initializeParticles() {
  particles = new Particle[numParticles];
  particles[0] = new OddballParticle(width / 2, height / 2);
  for (int i = 1; i < particles.length; i++) {
    particles[i] = new Particle(width / 2, height / 2);
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    initializeParticles();
  }
}
