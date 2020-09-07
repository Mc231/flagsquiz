import 'package:flagsquiz/foundation/random_pick_result.dart';
import 'package:flagsquiz/models/country.dart';

class Question {
  final Country answer;
  final List<Country> options;

  Question(this.answer, this.options);

  Question.fromRandomResult(RandomPickResult<Country> result)
      : this(result.answer, result.options);
}
