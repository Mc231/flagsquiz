import 'package:flagsquiz/bussiness_logic/countries_data_source.dart';
import 'package:flagsquiz/models/continent.dart';
import 'package:flagsquiz/models/country.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CountriesDataSource sut;
  final country1 =
      Country.fromJson({'name': 'Andorra', 'continent': 'EU', 'code': 'AD'});
  final country2 =
      Country.fromJson({'name': 'United Arab Emirates', 'continent': 'AS', 'code': 'AE'});
  final allCountries = [country1, country2];

  setUp(() {
    sut = CountriesDataSource(allCountries);
  });

  tearDown(() {
    sut = null;
  });

  test('get all countries', () {
    // Given
    final expectedContinent = Continent.ALL;
    // When
    final result = sut.getByContinent(expectedContinent);
    expect(result, equals(allCountries));
  });

  test('get get EU country', () {
    // Given
    final expectedContinent = Continent.EU;
    // When
    final result = sut.getByContinent(expectedContinent);
    expect(result, equals([country1]));
  });
}