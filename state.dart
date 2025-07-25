typedef PiecePlaces = ({
  ({String piece, bool white}) piece,
  Set<({int x, int y})> places,
});

typedef GameState = ({
  int turnNumber,
  bool whiteTurn,
  List<String> moveTypes,
  Set<PiecePlaces> pieces,
});

String rotate180(String piece) {
  if (piece.contains('^')) {
    if (piece[0] == '^') {
      return piece.substring(1) + '_';
    }
    return '_' + piece.substring(0, piece.length - 1);
  }
  if (piece.contains('_')) {
    if (piece[0] == '_') {
      return piece.substring(1) + '^';
    }
    return '^' + piece.substring(0, piece.length - 1);
  }
  String pieceSymbol = piece.substring(0, piece.length - 1);
  if (piece.endsWith('A')) {
    return pieceSymbol + 'V';
  }
  if (piece.endsWith('V')) {
    return pieceSymbol + 'A';
  }
  if (piece.endsWith('>')) {
    return pieceSymbol + '<';
  }
  if (piece.endsWith('<')) {
    return pieceSymbol + '>';
  }
  throw FormatException('no direction indicator: $piece');
}
