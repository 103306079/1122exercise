PImage face, eye, fly;
float eyeX_l = 160 ;
float eyeX_r = 440 ;
float eyeY = 250 ;

int tileSize = 30 ;

color[] colorArr = new color[3];

void setup() {  
  size(600, 600);
  face =  loadImage("face.png");
  eye =  loadImage("eye.png");
  fly =  loadImage("fly.png");
  noCursor();

  colorMode(HSB, 360, 100, 100);  
  colorArr[0] = color(32, 70, 100) ; //orange
  colorArr[1] = color(218, 80, 100) ; //blue
  colorArr[2] = color(216, 60, 100); //light blue

  noStroke();

  imageMode(CENTER);
}

void draw() {

  image(face, width/2, height/2);

  //draw eyes
  drawEye(eyeX_l, eyeY);
  drawEye(eyeX_r, eyeY);

  //draw scarf
  for (int tileX=0; tileX<width; tileX+=tileSize) {
    for (int tileY=0; tileY<height; tileY+=tileSize) {
      drawTile(tileX, tileY);
    }
  }
  
  image(fly, mouseX, mouseY);
}

//return radius function
float radianTowardsTarget(float eyeX, float eyeY) {
  return atan2(mouseY - eyeY, mouseX - eyeX);
}

//draw eyes function and print the radius
void drawEye(float eyeX, float eyeY) {
  pushMatrix();
  translate(eyeX, eyeY);
  rotate(radianTowardsTarget(eyeX,eyeY));  
  image(eye, 0, 0);
  popMatrix();
  textMode(CENTER);
  fill(#000000);
  text(degrees(radianTowardsTarget(eyeX,eyeY)),eyeX,eyeY);
}

//draw scraf
//if columnX & columnYcolumnY aren't in face part, then draw rect
void drawTile(int tileX, int tileY) {
  if (!(tileX>=tileSize*2 && tileX<width-tileSize*2 && tileY>=tileSize*2 && tileY<height-tileSize*2)) {
    int colorIndex = (tileX+tileY)/tileSize%3;
    fill(colorArr[colorIndex]);
    rect(tileX, tileY, tileSize, tileSize);
  }
}