float rot = 0.0;
PVector v10 = new PVector(4*25.1f,0.0f,0.0f);
PVector v20 = new PVector(4*20.0f,0.0f,0.0f);
PVector v30 = new PVector(4*20.0f,0.0f,0.0f);
PVector v40 = new PVector(4*20.0f,0.0f,0.0f);
PVector v50 = new PVector(4*20.0f,0.0f,0.0f);
PVector v60 = new PVector(4*20.0f,0.0f,0.0f);


double absQ(float q0,float q1,float q2,float q3){
  return Math.sqrt(q0*q0+q1*q1+q2*q2+q3*q3);
}

PVector rotate3(float q0, float q1, float q2, float q3, PVector v){
  double qabs = absQ(q0,q1,q2,q3);
  q0 = (float)q0/(float)qabs;
  q1 = (float)q1/(float)qabs;
  q2 = (float)q2/(float)qabs;
  q3 = (float)q3/(float)qabs;

  float v0 = v.x;
  float v1 = v.y;
  float v2 = v.z;

  float vx = v0*(1-2*q2*q2-2*q3*q3)+v1*(2*(q1*q2+q0*q3))+v2*(2*(q1*q3-q0*q2));
  float vy = v0*(2*(q1*q2-q0*q3))+v1*(1-2*q1*q1-2*q3*q2)+v2*(2*(q2*q3+q0*q1));
  float vz = v0*(2*(q1*q3+q0*q2))+v1*(2*(q2*q3-q0*q1))+v2*((1-2*q1*q1-2*q2*q2));

  return new PVector(vx,vy,vz);
}

void setup(){
  background(0);
  stroke(0);
  int width = 800;
  int height = 800;
  size(800,800,P3D);
  noFill();
}

void draw(){
  background(0);
  rot += 0.01;
  translate(width/8, height/8, 0);
  //translate(0, height/2, 0);
  stroke(255);
  rotateX(PI/3);
  rotateZ(PI/6+rot);
  
  PVector v1 = rotate3(0.99619,0,-0.08716,0,v10);
  PVector v2 = rotate3(0.98481,0,-0.17365,0,v20);
  PVector v3 = rotate3(0.96593,0,-0.25882,0,v30);
  PVector v4 = rotate3(0.93969,0,-0.34202,0,v40);
  PVector v5 = rotate3(0.90631,0,-0.42262,0,v50);
  PVector v6 = rotate3(0.86603,0,-0.5,0,v60);
  
  //PVector v3 = rotate3(0.85287,-0.08682,-0.4924,0.15038,v30);
  
  
  //rotateX(rot);
  //rotateZ(rot);
  
  beginShape();
  vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);
  
  //rotateX(PI/6);
  //rotateZ(PI/6);
  stroke(255,0,0);
  beginShape(LINES);
  vertex(0, 0, 0);
  vertex(v1.x,v1.y,v1.z);
  endShape();
  
  stroke(0,255,0);
  beginShape(LINES);
  vertex(v1.x,v1.y,v1.z);
  vertex(v1.x+v2.x, v1.y+v2.y, v1.z+v2.z);
  endShape();
  
  stroke(0,0,255);
  beginShape(LINES);
  vertex(v1.x+v2.x, v1.y+v2.y, v1.z+v2.z);
  vertex( v1.x+v2.x+v3.x, v1.y+v2.y+v3.y, v1.z+v2.z+v3.z);
  endShape();
  
  stroke(255,0,0);
  beginShape(LINES);
  vertex( v1.x+v2.x+v3.x, v1.y+v2.y+v3.y, v1.z+v2.z+v3.z);
  vertex( v1.x+v2.x+v3.x+v4.x, v1.y+v2.y+v3.y+v4.y, v1.z+v2.z+v3.z+v4.z);
  endShape();
  
  stroke(0,255,0);
  beginShape(LINES);
  vertex( v1.x+v2.x+v3.x+v4.x, v1.y+v2.y+v3.y+v4.y, v1.z+v2.z+v3.z+v4.z);
  vertex( v1.x+v2.x+v3.x+v4.x+v5.x, v1.y+v2.y+v3.y+v4.y+v5.y, v1.z+v2.z+v3.z+v4.z+v5.z);
  endShape();
  
  stroke(0,0,255);
  beginShape(LINES);
  vertex( v1.x+v2.x+v3.x+v4.x+v5.x, v1.y+v2.y+v3.y+v4.y+v5.y, v1.z+v2.z+v3.z+v4.z+v5.z);
  vertex( v1.x+v2.x+v3.x+v4.x+v5.x+v6.x, v1.y+v2.y+v3.y+v4.y+v5.y+v6.y, v1.z+v2.z+v3.z+v4.z+v5.z+v6.z);
  endShape(); //<>//
}