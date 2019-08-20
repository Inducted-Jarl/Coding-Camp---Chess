class Knight extends ChessPiece {
 Knight(Player p) {
   super(p);
  }
  
  ArrayList<MoveSpace> getLegalMoves() {
    ArrayList moves = new ArrayList<PieceSpace>();
    moves.add(at(2, -1));
    moves.add(at(-1, 2));
    moves.add(at(2, 1));
    moves.add(at(1, 2));
    moves.add(at(-2, -1));
    moves.add(at(-1, -2));
    moves.add(at(1, -2));
    moves.add(at(-2, 1));
    
    return getMovesFromSpaces(moves);
  }
    
  void show(float x, float y) {
    pushAll(x, y);
        rect(0, 40, 55, 4);
        ellipse(0.5, 15, 30, 50);
        rect(2, -15, 45, 5); // fork foundation  
        float n = -1;
        quad(-20, -20+n, -20, -35+n, 35, -25+n, 30, -20+n);
    popAll();
  }
}
