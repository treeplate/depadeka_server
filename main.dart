#!/home/treeplate/bin/dart-sdk/bin/dart

import 'dart:io';

void main() {
  print('Content-Type: text/plain\r\n\r');
  try {
    String board = stdin.readLineSync()!;
    String filename = '$board.dpdk';
    File file = File(filename);
    if (!file.existsSync()) {
      print('bad-game');
      print('$filename');
      return;
    }
    print('good-game');
    print('${file.readAsStringSync()}');
  } catch (e, st) {
    print(e);
    print(st);
  }
}
