import 'package:flags_quiz/foundation/business_logic/countries_data_source.dart';
import 'package:flags_quiz/models/continent.dart';
import 'package:flags_quiz/models/country.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CountriesDataSource sut;
  final country1 =
      Country.fromJson({'name': 'Andorra', 'continent': 'EU', 'code': 'AD'});
  final country2 =
      Country.fromJson({'name': 'United Arab Emirates', 'continent': 'AS', 'code': 'AE'});
  final allCountries = [country1, country2];

  setUp(() {
    sut = CountriesDataSource(allCountries);
  });

  test('get all countries', () {
    // Given
    final expectedContinent = Continent.all;
    // When
    final result = sut.getByContinent(expectedContinent);
    expect(result, equals(allCountries));
  });

  test('get get EU country', () {
    // Given
    final expectedContinent = Continent.eu;
    // When
    final result = sut.getByContinent(expectedContinent);
    expect(result, equals([country1]));
  });
}