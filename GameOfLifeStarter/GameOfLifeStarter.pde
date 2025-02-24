final int SPACING = 20; // each cell's width/height //<>// //<>//
final float DENSITY = 0.1; // how likely each cell is to be alive at the start
int[][] grid; // the 2D array to hold 0's and 1's

void setup() {
  size(800, 600); // adjust accordingly, make sure it's a multiple of SPACING
  noStroke(); // don't draw the edges of each cell
  frameRate(10); // controls speed of regeneration
  grid = new int[height / SPACING][width / SPACING];

  // populate initial grid
  // your code here

}

void draw() {
  showGrid();
  grid = calcNextGrid();
}

int[][] calcNextGrid() {
  int[][] nextGrid = new int[grid.length][grid[0].length];

  // your code here

  return nextGrid;
}

int countNeighbors(int y, int x) {
  int n = 0; // don't count yourself!
  
  // your code here
  // don't check out-of-bounds cells

  return n;
}

void showGrid() {
<<<<<<< HEAD
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      if (grid[i][j] == 1) {
        if (cellAge[i][j] == 1) {
          fill(0, 255, 0); // New alive cells are green
        } else {
          fill(139, 69, 19); //Dead cells are black
        }
      } else {
        fill(0);
      }
      square(j * SPACING, i * SPACING, SPACING);
    }
  }
}

void mousePress() {
  int col = mouseX / SPACING;
  int row = mouseY / SPACING;

  // Check to see if the mouse is inbound of the grid
  if (row >=0 && row < grid.length && col >= 0 && col < grid[0].length) {
    grid[row][col] = 1;
    cellAge[row][col] = 1;
  }
}

void keyPressed() {
  if (key == ' ') {
    isPaused = !isPaused;
  } else if (key == 'c' || key == 'C') {
    clearGrid();
  }
}

void clearGrid() {
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      grid[i][j] = 0;
      cellAge[i][j] = 0;
    }
  }
=======
  // your code here
  // use square() to represent each cell
  // use fill(r, g, b) to control color: black for empty, red for filled (or alive)
>>>>>>> parent of 2a18a6c (Populated t hhjhe   grid with random cells.)
}
