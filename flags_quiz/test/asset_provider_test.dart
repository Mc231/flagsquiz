import 'package:flagsquiz/foundation/asset_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class AssetBundleMock extends Mock implements AssetBundle {}

void main() {
  test('provide', () async {
    // Given
    final path = 'some/path';
    final expectedString = 'some string';
    final assetBundle = AssetBundleMock();
    final assetProvider = AssetProvider(path, assetBundle);
    // When
    when(assetBundle.loadString(path))
        .thenAnswer((_) => Future.value(expectedString));
    var result = await assetProvider.provide();
    // Then
    expect(result, equals(expectedString));
  });
}
