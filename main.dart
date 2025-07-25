#!/home/treeplate/bin/dart-sdk/bin/dart

import 'dart:io';

void main() {
  print('Content-Type: text/plain\r\n\r');
  try {
    String command = stdin.readLineSync()!;
    if (command == 'get-board') {
      String board = stdin.readLineSync()!;
      String filename = '$board.dpdk';
      File file = File(filename);
      if (!file.existsSync()) {
        print('error');
        return;
      }
      stdout.write('${file.readAsStringSync().trimRight()}');
    } else {
      print('invalid command');
    }
  } catch (e, st) {
    print(e);
    print(st);
  }
}
