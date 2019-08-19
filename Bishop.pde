class Bishop extends ChessPiece {
  Bishop(Player p) {
    super(p);
  }
  
  ArrayList<MoveSpace> getLegalMoves() {
    ArrayList arr = new ArrayList<PieceSpace>();
    arr.addAll(ray(1, 1));
    arr.addAll(ray(-1, 1));
    arr.addAll(ray(1, -1));
    arr.addAll(ray(-1, -1));
    return getMovesFromSpaces(arr);
  }
  
  void show(float x, float y) {
    pushAll(x, y);
      ellipse(0, 15, 25, 50); // body
      rect(0, 40, 45, -4); // foundation
      rect(0, -13, 30, -4); // head foundation
      triangle(0, -45, -12, -18, 12, -18); // head
      circle(0, -44, 10);
    popAll();
  }
}
