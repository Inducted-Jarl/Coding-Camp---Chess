class Pawn extends ChessPiece {
  Pawn(Player p) {
    super(p);
  }
  
   ArrayList<MoveSpace> getLegalMoves() {
    ArrayList moves = new ArrayList<PieceSpace>();
    // moving forward
    PieceSpace ahead = at(0, 1);
    if(ahead != null && ahead.piece == null) moves.add(ahead);
    
    // moving ahead by 2 on first move
    PieceSpace ahead2 = at(0, 2);
    if(!hasMoved && ahead.piece == null && ahead2.piece == null) moves.add(ahead2);
    
    //taking diagonally
    PieceSpace diag1 = at(1, 1);
    PieceSpace diag2 = at(-1, 1);
    if(diag1 != null && diag1.piece != null) moves.add(diag1);
    if(diag2 != null && diag2.piece != null) moves.add(diag2);

    return getMovesFromSpaces(moves);
    
   }
  
  void show(float x, float y) {
    pushAll(x, y);
        rect(0, 40, 55, 4);
        ellipse(0.5, 15, 30, 50);
        circle(0, -25, 25);

    popAll();
  }
}
