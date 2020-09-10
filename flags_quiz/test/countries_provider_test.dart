import 'package:flagsquiz/bussiness_logic/countries_provider.dart';
import 'package:flagsquiz/foundation/asset_provider.dart';
import 'package:flagsquiz/models/continent.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class AssetProviderMock extends Mock implements AssetProvider {}

void main() {
  AssetProvider assetProvider;
  CountriesProvider countriesProvider;

  setUp(() {
    assetProvider = AssetProviderMock();
    countriesProvider = CountriesProvider(assetProvider);
  });

  tearDown(() {
    assetProvider = null;
    countriesProvider = null;
  });

  test('default provider', () {
    var provider = CountriesProvider.standard();
    expect(provider, isNotNull);
  });

  test('provider provide countries', () async {
    var json = '''[
    {
    "name":"Andorra",
    "continent":"EU",
    "code":"AD"
    }
    ]''';
    when(assetProvider.provide())
        .thenAnswer((realInvocation) => Future.value(json));
    var countries = await countriesProvider.provide();
    expect(countries, isNotEmpty);
    expect(countries.first.name, equals('Andorra'));
    expect(countries.first.continent, equals(Continent.EU));
    expect(countries.first.code, equals('AD'));
  });
}
