import 'package:flags_quiz/models/continent.dart';
import 'package:flags_quiz/models/country.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:quiz_engine_core/quiz_engine_core.dart';

@GenerateNiceMocks([MockSpec<AssetProvider>()])
import 'countries_provider_test.mocks.dart';

void main() {
  late AssetProvider assetProvider;
  late QuizDataProvider countriesProvider;

  setUp(() {
    assetProvider = MockAssetProvider();
    countriesProvider = QuizDataProvider(assetProvider,  (data) => Country.fromJson(data, (_) => "Test"));
  });

  test('default provider', () {
    var provider =
        QuizDataProvider.standard('assets/Countries.json',  (data) => Country.fromJson(data, (_) => "Test"));
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
