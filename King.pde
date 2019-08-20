class King extends ChessPiece {
  King(Player p) {
    super (p);
  }
  
  ArrayList<MoveSpace> getLegalMoves() {
    ArrayList arr = new ArrayList<PieceSpace>();
    
    // up, down, and sideways
    arr.add(at(1, 0));
    arr.add(at(-1, 0));
    arr.add(at(0, 1));
    arr.add(at(0, -1));
    
    // diagnols
    arr.add(at(1, 1));
    arr.add(at(-1, 1));
    arr.add(at(1, -1));
    arr.add(at(-1, -1));
    
    return getMovesFromSpaces(arr);
  }
  
  void show(float x, float y) {
    pushAll(x, y);
        rect(0, 40, 55, 4);
        ellipse(0, 15, 23, 50);
        rect(0, -10, 43, 3);
        rect(0, -37, 20, 4);
        rect(0, -37, 4, 20);
        smooth();
        noStroke();
        float n = -71.5;
        pushMatrix();
          scale(0.7, 0.5);
          beginShape();
            vertex(0, 20+n);
            bezierVertex(0, n, 40, 10+n, 0, 45+n);
            vertex(0, 20+n);
            bezierVertex(0, n, -40, 10+n, 0, 45+n);
          endShape();
        popMatrix();
    popAll();
  }
}
