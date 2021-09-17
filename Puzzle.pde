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
