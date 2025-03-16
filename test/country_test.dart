import 'package:flags_quiz/models/continent.dart';
import 'package:flags_quiz/models/country.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('init country', () {
    // Given
    final expectedName = 'Antigua and Barbuda';
    final expectedContinent = 'NA';
    final expectedCode = 'ag';
    // When
    final country = Country.fromJson({
      'name': expectedName,
      'continent': expectedContinent,
      'code': expectedCode
    }, (_) => "Antigua and Barbuda");
    // Then
    expect(country.name, equals(expectedName));
    expect(country.continent, equals(Continent.na));
    expect(country.code, equals(expectedCode));
  });
}
