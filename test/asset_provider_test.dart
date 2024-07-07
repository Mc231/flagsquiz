import 'package:flagsquiz/foundation/asset_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<AssetBundle>()])
import 'asset_provider_test.mocks.dart';

void main() {
  test('provide', () async {
    // Given
    final path = 'some/path';
    final expectedString = 'some string';
    final assetBundle = MockAssetBundle();
    final assetProvider = AssetProvider(path, assetBundle);
    // When
    when(assetBundle.loadString(path))
        .thenAnswer((_) => Future.value(expectedString));
    var result = await assetProvider.provide();
    // Then
    expect(result, equals(expectedString));
  });
}