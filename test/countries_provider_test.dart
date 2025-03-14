import 'package:flags_quiz/foundation/asset_provider.dart';
import 'package:flags_quiz/foundation/business_logic/countries_provider.dart';
import 'package:flags_quiz/models/continent.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<AssetProvider>()])
import 'countries_provider_test.mocks.dart';

void main() {
  late AssetProvider assetProvider;
  late CountriesProvider countriesProvider;

  setUp(() {
    assetProvider = MockAssetProvider();
    countriesProvider = CountriesProvider(assetProvider);
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
    expect(countries.first.continent, equals(Continent.eu));
    expect(countries.first.code, equals('AD'));
  });
}
