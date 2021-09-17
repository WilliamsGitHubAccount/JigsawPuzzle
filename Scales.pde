color background_color = color(255, 220, 255);
Grid grid;

void setup() {
  background(background_color);
  size(750, 750);

  grid = new Grid(10, 10, 75);
  grid.generatePieces();
  grid.drawGrid();
}

void draw() {
}

color generateRandomColor() {
  return color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
}

class Grid {

  Piece[][] grid;
  int size;
  int rows;
  int columns;

  Grid(int rows, int columns, int size) {
    grid = new Piece[columns][rows];
    this.size = size;
    this.rows = rows;
    this.columns = columns;
    for (int y = 0; y < rows; y++) {
      for (int x = 0; x < columns; x++) {
        grid[x][y] = new Piece(size);
      }
    }
  }

  void generatePieces() {
    //Loops x & y is a nested loop. They interate through the entire gride of puzzle pieces
    //Loop i iterates through the 4 sides of each piece
    for (int y = 0; y < rows; y++) {
      for (int x = 0; x < columns; x++) {
        if (y != 0) {
          if (grid[x][y-1].sides[2] == 0)
            grid[x][y].sides[0] = (int)(Math.random()*2+1); //<-- Generates a random number between 1 & 2
          else if (grid[x][y-1].sides[2] == 1)
            grid[x][y].sides[0] = 2;
          else if (grid[x][y-1].sides[2] == 2)
            grid[x][y].sides[0] = 1;
        }
        if (x != columns-1) {
          if (grid[x+1][y].sides[3] == 0)
            grid[x][y].sides[1] = (int)(Math.random()*2+1);
          else if (grid[x+1][y].sides[3] == 1)
            grid[x][y].sides[1] = 2;
          else if (grid[x+1][y].sides[3] == 2)
            grid[x][y].sides[1] = 1;
        }
        if (y != rows-1) {
          if (grid[x][y+1].sides[0] == 0)
            grid[x][y].sides[2] = (int)(Math.random()*2+1);
          else if (grid[x][y+1].sides[0] == 1)
            grid[x][y].sides[2] = 2;
          else if (grid[x][y+1].sides[0] == 2)
            grid[x][y].sides[2] = 1;
        }
        if (x != 0) {
          if (grid[x-1][y].sides[1] == 0)
            grid[x][y].sides[3] = (int)(Math.random()*2+1);
          else if (grid[x-1][y].sides[1] == 1)
            grid[x][y].sides[3] = 2;
          else if (grid[x-1][y].sides[1] == 2)
            grid[x][y].sides[3] = 1;
        }
      }
    }
  }

  void drawGrid() {
    for (int y = 0; y < rows; y++) {
      for (int x = 0; x < columns; x++) {
        grid[x][y].drawSquare(x, y, size);
      }
    }
    for (int y = 0; y < rows; y++) {
      for (int x = 0; x < columns; x++) {
        grid[x][y].drawPiece(x, y, size);
      }
    }
  }
}

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

  void drawPiece(int x, int y, int siwwze) {
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
