final int SPACING = 20; // each cell's width/height //<>// //<>//
final float DENSITY = 0.1; // how likely each cell is to be alive at the start
int[][] grid; // the 2D array to hold 0's and 1's
int[][] cellAge; // Holds the age's of each cell
boolean isPaused = false;


void setup() {
  size(600, 600); // adjust accordingly, make sure it's a multiple of SPACING
  noStroke(); // don't draw the edges of each cell
  frameRate(10); // controls speed of regeneration
  int rows = height / SPACING;
  int cols = width / SPACING;
  grid = new int[rows][cols];
  cellAge = new int[rows][cols];

  // populate initial grid
  for (int i = 0; i < cols; i++) {
    for ( int j = 0; j < rows; j++) {
      if (random(1) > DENSITY) {
        grid[i][j] = 0;
      } else {
        grid[i][j] = 1;
      }
    }
  }
}

void draw() {
  showGrid();

  if (!isPaused) {
    grid = calcNextGrid();
  }

  mousePress();
}

int[][] calcNextGrid() {
  int[][] nextGrid = new int[grid.length][grid[0].length];

  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      int neighbors = countNeighbors(i, j);

      // Rule of Game of Life
      if (grid[i][j] == 1) {
        if (neighbors < 2 || neighbors > 3) {
          nextGrid[i][j] = 0;
          cellAge[i][j] = 0; // The age of the cell resets
        } else {
          nextGrid[i][j] =1;
          cellAge[i][j]++; // The age of the cell increases
        }
      } else {
        if (neighbors == 3) {
          nextGrid[i][j] = 1;
          cellAge[i][j] = 1;
        }
      }
    }
  }
  return nextGrid;
}

int countNeighbors(int y, int x) {
  int n = 0; // don't count yourself!

  for (int i = -1; i <= 1; i ++) {
    for ( int j = -1; j <= 1; j++) {
      if (i == 0 && j == 0) {
        continue;
      }

      int neighX = x + i; // Neighbor X coordinate
      int neighY = y + j; // Neighbor Y coordinate

      // skips out of bounds cells
      if ( neighY >=0 && neighY < grid.length && neighX >= 0 && neighX < grid[0].length) {
        n += grid[neighY][neighX];
      }
    }
  }
  return n;
}

void showGrid() {
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
}
