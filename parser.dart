import 'dart:io';

import 'state.dart';

/// Reads a file and parses it into a [GameState].
GameState parse(String filename) {
  List<String> lines = File(filename).readAsLinesSync();
  List<String> parts = lines.first.split(' ');
  int turnNumber = int.parse(parts.first.substring(0, parts.first.length - 1));
  bool whiteTurn = parts.first[parts.first.length - 1] == 'w';
  List<String> moveTypes = parts.last.split('');
  Set<PiecePlaces> pieces = {};
  for (String line in lines.skip(1)) {
    parts = line.split(' ');
    String piece = parts.first.substring(0, parts.first.length - 1);
    bool white = parts.first[parts.first.length - 1] == 'w';
    Set<({int x, int y})> positions = parts
        .skip(1)
        .map(algebraicToPair)
        .toSet();
    pieces.add((piece: (piece: piece, white: white), places: positions));
  }
  return (
    turnNumber: turnNumber,
    whiteTurn: whiteTurn,
    moveTypes: moveTypes,
    pieces: pieces,
  );
}

/// Prints a [GameState] in .dpdk format.
/// Usually piped into a file.
void serialize(GameState state) {
  print('${state.turnNumber}${state.whiteTurn ? 'w' : 'b'} ${state.moveTypes.join('')}');
  for (PiecePlaces piece in state.pieces) {
    print('${piece.piece.piece}${piece.piece.white ? 'w' : 'b'} ${piece.places.map((e) => pairToAlgebraic(e)).join(' ')}');
  }
}

({int x, int y}) algebraicToPair(String square) {
  String letter = square[0];
  int y = int.parse(square.substring(1)) - 1;
  int x = letter.codeUnits.single - 0x61;
  return (x: x, y: y);
}
String pairToAlgebraic(({int x, int y}) square) {
  String letter = String.fromCharCode(square.x + 0x61);
  return '$letter${square.y+1}';
}

