import 'package:flags_quiz/foundation/random_item_picker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late RandomItemPicker<int> sut;

  setUp(() {
    sut = RandomItemPicker([]);
  });

  test('replace items', () {
    // Given
    final expectedItems = Iterable<int>.generate(10).toList();
    expect(sut.items, isEmpty);
    // When
    sut.replaceItems(expectedItems);
    // Then
    expect(sut.items, equals(expectedItems));
  });

  test('empty items', () {
    // Given
    expect(sut.items, isEmpty);
    // When
    final result = sut.pick();
    // Then
    expect(result, isNull);
  });

  test('pick 1 when count == items.length', () {
    // Given
    final expectedItems = Iterable<int>.generate(8).toList();
    expectedItems.reversed;
    expect(sut.items, isEmpty);
    // When
    sut.replaceItems(expectedItems);
    for (var _ in Iterable<int>.generate(4)) {sut.pick();}
    final result = sut.pick();
    // Then
    expect(result, isNotNull);
  });

  test('pick random item', () {
    // Given
    final expectedItems = Iterable<int>.generate(10).toList();
    expect(sut.items, isEmpty);
    // When
    sut.replaceItems(expectedItems);
    final result = sut.pick();
    // Then
    expect(result, isNotNull);
  });
}