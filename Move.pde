static enum Type {
  MOVE, TAKE, CASTLE, ENPASSANT
}

class Move {
  ChessPiece moved, taken;
  Coord from, to;
  Type type;
  ArrayList<Move> threats;
  
  Move(ChessPiece[][] pieces, int fromR, int fromF, int toR, int toF, Type type) {
    this.moved = pieces[fromR][fromF];
    this.to = new Coord(toR, toF);
    this.from = new Coord(fromR, fromF);
    this.type = type;
    if(type == Type.TAKE) this.taken = pieces[toR][toF];
  }
  Move(ChessPiece[][] pieces, int fromR, int fromF, int toR, int toF) {
    this(pieces, fromR, fromF, toR, toF, Type.MOVE);
  }
  
  Position applyTo(Position old) {
    ChessPiece[][] newBoard = old.clonePieces();
    if(type == Type.MOVE || type == Type.TAKE) {
      newBoard[to.rank][to.file] = moved;
      newBoard[from.rank][from.file] = null;
    } else if(type == Type.CASTLE) {
      // TODO
    }
    return new Position(newBoard, this);
  }
  
  boolean matches(Move m) {
    return m.from.matches(this.from) && m.to.matches(this.to);
  }
}
