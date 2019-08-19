class Rook extends ChessPiece {
  Rook(Player p) {
    super(p);
  }
  
  ArrayList<MoveSpace> getLegalMoves() {
    ArrayList arr = new ArrayList<PieceSpace>();
    arr.addAll(ray(1, 0));
    arr.addAll(ray(-1, 0));
    arr.addAll(ray(0, 1));
    arr.addAll(ray(0, -1));
    return getMovesFromSpaces(arr);
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
