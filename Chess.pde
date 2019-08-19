Player p1, p2;
Board board;
void setup() {
  size(800, 800);
  rectMode(CENTER);
  p2 = new Player(color(0)); //black
  p1 = new Player(color(222, 185, 65)); //white
  board = new Board(p1, p2);
}


void draw() {
  background(255);
  board.show();
}
