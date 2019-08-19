class PieceSpace {
  Clickable square;
  ChessPiece piece;
  color col;
  boolean isTake;
  
  PieceSpace(float x, float y, color c) {
     PVector pos = new PVector(x, y);
     square = new Clickable(pos, width / 8, height / 8);
     col = c;
}  
  
  void show() {
    color c;
    if(square.isHovered()) {
        int bright = + 33;
        c = color(red(col) + bright, 
                  green(col) + bright,
                  blue(col) + bright);
      } else {
        c = col;
      }
    pushStyle();
      noStroke();
      fill(c);
      rect(square.center.x, 
         square.center.y, 
         square.sizeX, 
         square.sizeY); 
    popStyle();
    if(piece != null) {
    piece.show(square.center.x, square.center.y);
    }
  }
}