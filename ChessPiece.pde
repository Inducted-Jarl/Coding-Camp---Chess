abstract class ChessPiece {
  Player owner;
  color col;
  int r, c;
  boolean hasMoved;
  PieceSpace[][] spaces;
  
  ChessPiece(Player p) {
    owner = p;
    col = owner.col;
  }
  
  void setSpaces(PieceSpace[][] s) {
    spaces = s;
  }
  
  abstract void show(float x, float y);
  abstract ArrayList<MoveSpace> getLegalMoves();
  
  void setPos(int r, int c) {
    this.r = r;
    this.c = c;
  }
  
  ArrayList<MoveSpace> getMovesFromSpaces(ArrayList<PieceSpace> arr) {
    ArrayList<MoveSpace> moves = new ArrayList<MoveSpace>();
    for(PieceSpace p : arr) {
      if(p == null) continue;
      if(p.piece != null) {
        if(p.piece.owner != this.owner) {
          moves.add(new MoveSpace(p, true));
          }
        } else {
          moves.add(new MoveSpace(p, false));
      }
    }
    return moves;
  }
  
  ArrayList<PieceSpace> ray(int xChange, int yChange) {
    // returns a list of potential moces along a ray (for Rook, Bishop, and Queen)
    ArrayList<PieceSpace> arr = new ArrayList<PieceSpace>();
    if(owner.forward) yChange *= -1; // invert y if players moves other direction
    int x = c + xChange;
    int y = r + yChange;
    while(inBounds(x, y)) {
      // as long as within bounds of board, add to list and apply change
      arr.add(spaces[y][x]);
      if(spaces[y][x].piece != null) break; // collided with other piece, add to list then stop
      x += xChange;
      y += yChange;
    }
    return arr;
  }
  
  PieceSpace at(int xChange, int yChange) {
    // returns Piecespace at (xChange, yChange) relative to this piece
    if(owner.forward) yChange *= -1; // invert y if players moves other direction
    if(!inBounds(r + yChange, c + xChange)) return null;
    return spaces[r + yChange][c + xChange];
  }
  
  boolean inBounds(int x, int y) {
    return x >= 0 && x < 8 && y >= 0 && y < 8;
  }
  
  void pushAll(float x, float y) {
    pushMatrix();
    translate(x, y);
    pushStyle();
    fill(col);
    noStroke();
  }
  
  void popAll() {
    popStyle();
    popMatrix();
  }
}
