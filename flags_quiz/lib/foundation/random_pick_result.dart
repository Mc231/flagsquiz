/// Represents answer and options from random generated question
class RandomPickResult<T> {
  final T answer;
  final List<T> options;

  RandomPickResult(this.answer, this.options);
}
