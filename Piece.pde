class Piece {
  /*
    0 = Smooth
   1 = Tab
   2 = Blank
   */

  //sides = {top, right, bottom, left}
  int[] sides = {0, 0, 0, 0};

  int size;
  color c = generateRandomColor();

  Piece(int size) {
    this.size = size;
  }

  void drawSquare(int x, int y, int size) {
    fill(c);
    noStroke();
    rect(x*size, y*size, x*size+size, y*size+size);
  }

  void drawPiece(int x, int y, int size) {
    fill(c);
    noStroke();

    for (int i = 0; i < sides.length; i++) {
      switch(sides[i]) {
      case 0:
        break;
      case 1:
        pushMatrix();
        translate(x*size+size/2, y*size+size/2);
        rotate((float)(i*(Math.PI/2)));
        drawTab(0, -size/2, size);
        popMatrix();
        break;
      case 2:
        break;
      }
    }
  }

  void drawTab(int x, int y, int size) {
    fill(c);
    noStroke();
    beginShape();
    curveVertex((float)(x-size/6), (float)(y));
    curveVertex((float)(x-size/6), (float)(y));
    curveVertex((float)(x-size/6), (float)(y-size/4));
    curveVertex((float)(x+size/6), (float)(y-size/4));
    curveVertex((float)(x+size/6), (float)(y));
    curveVertex((float)(x+size/6), (float)(y));
    endShape();
  }

}
