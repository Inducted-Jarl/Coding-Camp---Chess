class Queen extends ChessPiece {
  Queen (Player p) {
    super(p);
  }
  
  int pieceValue() {return 9;}
  
ArrayList<Move> getMoves(Position p, int r, int f) {
    super.setTemp(p, r, f);
    ArrayList <Move> moves = new ArrayList<Move>();
    
    // up, down, and sideways
    moves.addAll(ray(1, 0));
    moves.addAll(ray(-1, 0));
    moves.addAll(ray(0, 1));
    moves.addAll(ray(0, -1));
    
    // diagnols
    moves.addAll(ray(1, 1));
    moves.addAll(ray(-1, 1));
    moves.addAll(ray(1, -1));
    moves.addAll(ray(-1, -1));
    
    return moves;
  }
  
  void show(float x, float y) {
    pushAll(x, y);
  
        ellipse(0, 13, 30, 55);
        rect(0, 40, 65, 5);
        rect(0, -15, 55, 5);
        triangle(0, -45, 12, -20, -12, -20); // center tri
        triangle(-20, -45, -13, -20, -27, -20); // left tri
        triangle(20, -45, 13, -20, 27, -20); // right tri
        
        
        circle(0, -45, 10);
        
        popAll();
  }
  
  void diamond(float x, float y, float w, float h) {
   quad(x + w/2, y, x, y + h/2, x - w/2, y, x, y - h/2); 
  }
}
