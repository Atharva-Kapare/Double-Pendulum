int number_of_pendulums = 100;



Pendulum[] p = new Pendulum[number_of_pendulums];

void setup() {
  size(1200,800);
  stroke(255);
  
  for(int i = 0; i < p.length; i++){
    //The constructor takes (float startX, float startY, float startAngle1, float startAngle2, float mass1, float mass2, float length1, float length2, float angle1Velocity, float angle2Velocity, float gravity)
    p[i] = new Pendulum(0, 0, PI/2, PI/2, 40, 40, 200, 200, 0.000001*i, 0, 1);
  }
}

void draw() {
  background(0);
  
  translate(width/2, height/3);
  
  for(int i = 0; i < p.length; i++){
    p[i].update();
    p[i].show();
  }
  
}
