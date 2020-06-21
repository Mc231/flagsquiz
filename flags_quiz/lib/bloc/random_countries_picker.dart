import 'package:flagsquiz/models/country.dart';

class RandomCountryResult {
  final Country answer;
  final List<Country> options;

  RandomCountryResult(this.answer, this.options);
}

class RandomCountriesPicker {
  final List<Country> answered = [];
  final List<Country> countries;
  final int count;
  static const _defaultCount = 4;

  RandomCountriesPicker(this.countries, [this.count = _defaultCount]);

  RandomCountryResult pick() {
    if (count >= countries.length) {
      if (countries.isEmpty) {
        print('Game Over');
        return null;
      }
      countries.shuffle();
      var answer = (countries..shuffle()).first;
      answered.shuffle();
      var options = answered.sublist(0, 3);
      options.add(answer);
      options.shuffle();
      return _createResult(answer, options);
    }
    countries.shuffle();
    var options = countries.sublist(0, 4);
    var answer = (options..shuffle()).first;
    options.shuffle();
    return _createResult(answer, options);
  }

  RandomCountryResult _createResult(Country answer, List<Country> options) {
    countries.remove(answer);
    answered.add(answer);
    return RandomCountryResult(answer, options);
  }
}