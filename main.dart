#!/home/treeplate/bin/dart-sdk/bin/dart

import 'dart:io';

void main() {
  print('Content-Type: text/plain\r\n\r');
  try {
    String? command = stdin.readLineSync();
    if (command == null) {
      print('error: no body');
      return;
    }
    if (command == 'get-board') {
      String? board = stdin.readLineSync();
      if (board == null) {
        print('error: board name not provided');
        return;
      }
      String filename = '$board.dpdk';
      File file = File(filename);
      if (!file.existsSync()) {
        print('error: board does not exist');
        return;
      }
      stdout.write('${file.readAsStringSync().trimRight()}');
    } else {
      print('error: invalid command');
    }
  } catch (e, st) {
    print(e);
    print(st);
  }
}
