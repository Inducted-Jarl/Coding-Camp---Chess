class Queen extends ChessPiece {
  Queen (Player p) {
    super(p);
    
  }
  
  ArrayList<MoveSpace> getLegalMoves() {
    ArrayList arr = new ArrayList<PieceSpace>();
    
    // up, down, and sideways
    arr.addAll(ray(1, 0));
    arr.addAll(ray(-1, 0));
    arr.addAll(ray(0, 1));
    arr.addAll(ray(0, -1));
    
    // diagnols
    arr.addAll(ray(1, 1));
    arr.addAll(ray(-1, 1));
    arr.addAll(ray(1, -1));
    arr.addAll(ray(-1, -1));
    
    return getMovesFromSpaces(arr);
  }
  
  void show(float x, float y) {
    pushAll(x, y);
  
        ellipse(0, 13, 30, 55);
        rect(0, 40, 55, 5);
        rect(0, -15, 45, 5);
        triangle(0, -45, 12, -20, -12, -20);
        triangle(-25, -35, -13, -10, -37, -20);
        
        popAll();
  }
}
