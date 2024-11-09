class Particle {
  constructor(centerX, centerY) {
    this.x = centerX;
    this.y = centerY;
    this.c = color(random(255), random(255), random(255), 255);
    this.angle = random(TWO_PI);
    this.speed = random(2, 5);
    this.lifespan = 255;
  }

  move() {
    this.x += cos(this.angle) * this.speed;
    this.y += sin(this.angle) * this.speed;
    this.lifespan -= 3;
    if (this.lifespan < 0) this.lifespan = 0;
  }

  show() {
    fill(this.c.levels[0], this.c.levels[1], this.c.levels[2], this.lifespan);
    noStroke();
    ellipse(this.x, this.y, 10, 10);
  }
}

class OddballParticle extends Particle {
  constructor(centerX, centerY) {
    super(centerX, centerY);
    this.c = color(255, 0, 0, 255);
  }

  move() {
    this.x += random(-5, 5);
    this.y += random(-5, 5);
  }

  show() {
    fill(this.c.levels[0], this.c.levels[1], this.c.levels[2], this.lifespan);
    noStroke();
    ellipse(this.x, this.y, 20, 20);
  }
}

let particles = [];
const numParticles = 300;

function setup() {
  createCanvas(800, 600);
  initializeParticles();
}

function draw() {
  fill(0, 20);
  rect(0, 0, width, height);
  
  for (let p of particles) {
    p.move();
    p.show();
  }
}

function initializeParticles() {
  particles = [];
  particles.push(new OddballParticle(width / 2, height / 2));
  for (let i = 1; i < numParticles; i++) {
    particles.push(new Particle(width / 2, height / 2));
  }
}

function keyPressed() {
  if (key === 'r' || key === 'R') {
    initializeParticles();
  }
}

function keyPressed() {
  if (key === 'r' || key === 'R') {
    initializeParticles();
  }
}
