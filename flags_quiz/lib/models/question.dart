import 'package:flagsquiz/foundation/random_pick_result.dart';

class Question<T> {
  final T answer;
  final List<T> options;

  // TODO: - Add check options can not be empty
  Question(this.answer, this.options);

  Question.fromRandomResult(RandomPickResult<T> result)
      : this(result.answer, result.options);
}
