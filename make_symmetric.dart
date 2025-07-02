import 'parser.dart';
import 'state.dart';

void main() {
  GameState state = parse('just_white.dpdk');
  Set<PiecePlaces> newPieces = state.pieces.toSet();
  for (PiecePlaces piece in state.pieces) {
    String newDirection = rotate180(piece.piece.piece);
    newPieces.add((piece: (piece: newDirection, white: !piece.piece.white), places: piece.places.map((e) => (x: 12-e.x, y: 15-e.y)).toSet()));
  }
  GameState newState = (turnNumber: state.turnNumber, whiteTurn: state.whiteTurn, moveTypes: state.moveTypes, pieces: newPieces);
  serialize(newState);
}