PShader sh;
PGraphics dibujo1;
PGraphics rendershader;
void setup() {
  size(600, 600, P2D);

  dibujo1 = createGraphics(width, height, P2D);
  rendershader = createGraphics(width, height, P2D);
  sh = loadShader("lala.frag");
}

void draw() {

  PImage fb = rendershader;
  procesarDibujoProcessing();
  //LES PASO LAS UNIFORM Y LO DIBUJO DENTRO DE UN RECT :
  sh.set("feedback", fb);
  sh.set("dibujo", dibujo1);
  sh.set("time", (float)millis() / 1000);
  sh.set("resolution", (float)width, (float)height);
  sh.set("mouse", map(mouseX, 0, width, 0.0, 1.0), map(mouseY, 0, height, 0.0, 1.0));
  procesarRenderShader();

  image(rendershader, 0, 0, width, height);
   
}
void procesarRenderShader() {

  rendershader.beginDraw();
  rendershader.shader(sh);
  rendershader.rectMode(CENTER);
  rendershader.rect(width/2, height/2, width, height);
  rendershader.endDraw();
}
void procesarDibujoProcessing() {
  //Procesar el render
  dibujo1.beginDraw();

  background(0);
  int cnt1 = 10;
  int cnt2 = 10;
  for (int k=0; k<cnt1; k++) {
    for (int i=0; i<cnt2; i++) {
      float index = map(i, 0, cnt2-1, 0, TWO_PI);
      float index2 = map(k, 0, cnt1-1, 0, TWO_PI);
      float amp = sin(millis()*0.0005+index2)*100+100;
      float xx = sin(index+millis()*0.0002)*amp;
      float yy = cos(index+millis()*0.0002)*amp;

      dibujo1.fill(map(k, 0, cnt1-1, 0, 255), map(k, 0, cnt1-1, 0, 255), map(k, 0, cnt1-1, 255, 0));
      dibujo1.ellipse(width/2+xx, height/2+yy, 20, 20);
    }
  }

  dibujo1.endDraw();
}

void keyPressed() {


  //Para recargar el shader : 
  if (key == 'r') {
    sh = loadShader("lala.frag");
  }
}
