import 'package:flagsquiz/bloc/random_countries_picker.dart';
import 'package:flagsquiz/models/country.dart';

class Question {
  final Country answer;
  final List<Country> options;

  Question(this.answer, this.options);

  Question.fromRandomResult(RandomCountryResult result)
      : this(result.answer, result.options);
}
