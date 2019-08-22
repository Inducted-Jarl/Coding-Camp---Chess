GameHandler game;
Player p1, p2;
Board board;

void setup() {
  size(800, 800);
  rectMode(CENTER);

  board = new Board();
  p1 = new GraphicalPlayer(color(222, 185, 65)); //white
  p2 = new GraphicalPlayer(color(0)); //black
  game = new GameHandler( board, p1, p2);
}


void draw() {
  board.show();
  game.onLoop();
}
