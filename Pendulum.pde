

class Pendulum {
  
  float x1;
  float y1;
  float m1;
  float m2;
  float l1;
  float l2;
  float angle1;
  float angle2;
  float angle1Velocity;
  float angle2Velocity;
  float gravity;
  
  Pendulum(float startX, float startY, float startAngle1, float startAngle2, float m1, float m2, float l1, float l2, float angle1Velocity, float angle2Velocity, float gravity){
    this.x1 = startX;
    this.y1 = startY;
    this.m1 = m1;
    this.m2 = m2;
    this.l1 = l1;
    this.l2 = l2;
    this.angle1 = startAngle1;
    this.angle2 = startAngle2;
    this.angle1Velocity = angle1Velocity;
    this.angle2Velocity = angle2Velocity;
    this.gravity = gravity;
  }
  
  void update(){
    //The following equations were taken from https://www.myphysicslab.com/pendulum/double-pendulum-en.html
    float numerator1 = -gravity * (2 * m1 + m2) * sin(angle1);
    float numerator2 = -m2 * gravity * sin(angle1-2*angle2);
    float numerator3 = -2*sin(angle1-angle2)*m2;
    float numerator4 = angle2Velocity*angle2Velocity*l2+angle1Velocity*angle1Velocity*l1*cos(angle1-angle2);
    float denominator = l1 * (2*m1+m2-m2*cos(2*angle1-2*angle2));
  
    float angle1Acceleration = (numerator1 + numerator2 + numerator3 * numerator4) / denominator;
  
    numerator1 = 2 * sin(angle1-angle2);
    numerator2 = (angle1Velocity*angle1Velocity*l1*(m1+m2));
    numerator3 = gravity * (m1 + m2) * cos(angle1);
    numerator4 = angle2Velocity*angle2Velocity*l2*m2*cos(angle1-angle2);
    denominator = l2 * (2*m1+m2-m2*cos(2*angle1-2*angle2));
  
    float angle2Acceleration = (numerator1 * (numerator2 + numerator3 + numerator4)) / denominator;
  
    //Change the velocity based on acceleration and the position based on velocity
    this.angle1Velocity += angle1Acceleration;
    this.angle2Velocity += angle2Acceleration;
  
    this.angle1 += this.angle1Velocity;
    this.angle2 += this.angle2Velocity;
  }
  
  void show(){
    //Draw the first pendulum
    float x2 = l1 * sin(angle1);
    float y2 = l1 * cos(angle1);
    line(x1,y1,x2,y2);
    ellipse(x2,y2,m1,m1);
  
  
  
    //Draw the second pendulum appending off of the first one
    //translate(x2,y2);
    float x3 = x2 + l2 * sin(angle2);
    float y3 = y2 + l2 * cos(angle2);
    line(x2,y2,x3,y3);
    ellipse(x3,y3,m2,m2);
  }
}
