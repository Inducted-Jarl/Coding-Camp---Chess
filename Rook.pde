class Rook extends ChessPiece {
  Rook(Player p) {
    super(p);
  }
  
  int pieceValue() {return 5;}
  
 ArrayList<Move> getMoves(Position p, int r, int f) {
    super.setTemp(p, r, f);
    ArrayList <Move> moves = new ArrayList<Move>();
    moves.addAll(ray(1, 0));
    moves.addAll(ray(-1, 0));
    moves.addAll(ray(0, 1));
    moves.addAll(ray(0, -1));
    return moves;
  }
  
  void show(float x, float y) {
    pushAll(x, y);
      ellipse(0, 15, 25, 55); // body
      rect(0, 40, 50, -5); // foundation
      rect(0, -15, 50, 5); // fork foundation
      rect(0, -35, 7, 22); // middle fork
      rect(-22, -30, 5.7, 15); // left fork
      rect(22, -30, 5.7, 15); // right fork
    popAll();
  }
}
