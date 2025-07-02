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
      return piece.substring(1) + '꘍';
    } else {
      return '꘍' + piece.substring(0, piece.length - 1);
    }
  } else if (piece.contains('꘍')) {
    if (piece[0] == '꘍') {
      return piece.substring(1) + '^';
    } else {
      return '^' + piece.substring(0, piece.length - 1);
    }
  }
  return rotate180Map[piece] ?? piece;
}

Map<String, String> rotate180Map = {
  'C': 'Ɔ',
  'Ɔ': 'C',
  'ᑎ': 'U',
  'U': 'ᑎ',
  'c': 'ɔ',
  'ɔ': 'c',
  'n': 'u',
  'u': 'n',
  'c̱': 'ɔ̱',
  'ɔ̱': 'c̱',
  'ṉ': 'u̱',
  'u̱': 'ṉ',
  'B': 'ᗺ',
  '⏔': '\u202dߘ',
  'ᗺ': 'B',
  '\u202dߘ': '⏔',
  'b': 'q',
  'ᓂ': 'ᓗ',
  'q': 'b',
  'ᓗ': 'ᓂ',
};