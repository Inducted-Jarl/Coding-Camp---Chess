class Pawn extends ChessPiece {
  Pawn(Player p) {
    super(p);
  }
  
  void show(float x, float y) {
    pushAll(x, y);
        rect(0, 40, 55, 4);
        ellipse(0.5, 15, 30, 50);
        circle(0, -25, 25);
    popAll();
  }
}
