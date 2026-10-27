import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'production Dart files stay below the 150-line maintainability limit',
    () {
      final sourceFiles = Directory('lib')
          .listSync(recursive: true)
          .whereType<File>()
          .where((file) => file.path.endsWith('.dart'));
      final tooLong = sourceFiles
          .where((file) => file.readAsLinesSync().length > 150)
          .map((file) => '${file.path}: ${file.readAsLinesSync().length}')
          .toList();
      expect(
        tooLong,
        isEmpty,
        reason: 'Split the file into focused, reusable components.',
      );
    },
  );
}
