class PieceMover {
  Player p1, p2;
  PieceSpace[][] spaces;
  Player turn;
  PieceSpace selected;
  
  PieceMover(Player p1, Player p2, PieceSpace[][] s) {
    this.p1 = p1;
    this.p2 = p2;
    spaces = s;
    turn = p1;
  }
  
  void update() {
    
     // find hovered space and settting selcted space if clicked
     PieceSpace hovered = null;
     outer: for(int r = 0; r < 8; r ++) {
       for(int c = 0; c < 8; c++) {
         PieceSpace s = spaces[r][c];
         if(s.square.isHovered()) {
           // found hovered square
           if(s.piece != null && s.piece.owner == turn) {
         // piece on same team
         hovered = s;
         if(s.square.isClicked()) {
           if(s == selected) selected = null; //unselected
           else selected = s; // selected new square
         }
       } else if(selected != null && s.square.isClicked()) {
         // trying to move, check if valid move
         ArrayList<MoveSpace> moves = selected.piece.getLegalMoves();
         for(MoveSpace move : moves) {
           if(move.space == s) {
             // valid move
             movePiece(selected, s);
             s.piece.setPos(r, c);
             selected = null;
             switchPlayer();
             return;
           }
         }
       }
       break outer; //stop searching
    }
  }
}
     
     // setting showMoveSpace to which ever should be show
     PieceSpace showMoveSpace = null;
     if(selected != null) {
       showMoveSpace = selected;
     } else if(hovered != null) {
       showMoveSpace = hovered;
     }
     
     // show potential moves
     if(showMoveSpace != null && showMoveSpace.piece != null) {
      ArrayList<MoveSpace> arr = showMoveSpace.piece.getLegalMoves();
      for(MoveSpace m : arr) {
        PVector v = m.space.square.center;
        pushStyle();
          if(m.isTake) fill(148, 244, 148);
          else fill(71, 71, 254);
          noStroke();
          circle(v.x, v.y, 10);
        popStyle();
      }
    }
    
    // color background square of selected
    if(selected != null) {
      selected.show(color(0, 0, 200));
    }
  }
  
  void movePiece(PieceSpace from, PieceSpace to) {
    to.piece = from.piece;
    from.piece = null;
    from = null;
  }
  
  void switchPlayer() {
    if(turn == p1) turn = p2;
    else turn = p1;
    
  }
}
