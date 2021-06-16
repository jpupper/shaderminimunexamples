PShader sh;
PGraphics dibujo1;
void setup() {
  size(600, 600, P2D);

  sh = loadShader("lala.frag");
}

void draw() {
  background(0);
  //LES PASO LAS UNIFORM Y LO DIBUJO DENTRO DE UN RECT :
  sh.set("time", (float)millis() / 1000);
  sh.set("resolution", (float)width, (float)height);
  sh.set("mouse", map(mouseX, 0, width, 0.0, 1.0), map(mouseY, 0, height, 0.0, 1.0));
  shader(sh);
  rectMode(CENTER);
  rect(width/2, height/2, width, height);

}

void keyPressed() {


  //Para recargar el shader : 
  if (key == 'r') {
    sh = loadShader("lala.frag");
  }
  
  
}
