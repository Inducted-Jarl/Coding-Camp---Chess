Player p1, p2;
Board board;
PieceMover mover;

void setup() {
  size(800, 800);
  rectMode(CENTER);

  p1 = new Player(color(222, 185, 65)); //white
  p2 = new Player(color(0)); //black
  board = new Board(p1, p2);
  mover = new PieceMover(p1, p2, board.spaces);

}
void draw() {
  board.show();
  mover.update();
}
