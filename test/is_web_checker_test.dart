import 'package:flagsquiz/foundation/is_web_checker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('IsWebCheckerImpl returns correct value based on kIsWeb', () {
    final isWebChecker = IsWebCheckerImpl();
    expect(isWebChecker.isWeb(), equals(kIsWeb));
  });
}