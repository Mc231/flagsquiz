/// Represents the answer and options generated from a random question.
///
/// The `RandomPickResult` class encapsulates the result of a random item
/// selection process, providing the correct answer and a list of options.
/// It is used in scenarios where a set of options is presented to the user,
/// with one of them being the correct answer.
///
/// This class is typically used in conjunction with a random item picker,
/// such as the `RandomItemPicker` class, to structure the output of a
/// random selection operation.
///
/// Example usage:
/// ```dart
/// RandomPickResult<String> result = RandomPickResult('Apple', ['Apple', 'Banana', 'Cherry', 'Date']);
/// print('Answer: ${result.answer}'); // Output: Apple
/// print('Options: ${result.options}'); // Output: [Apple, Banana, Cherry, Date]
/// ```
class RandomPickResult<T> {
  /// The correct answer from the randomly generated question.
  final T answer;

  /// The list of options presented to the user, including the answer.
  final List<T> options;

  /// Creates a `RandomPickResult` with the given [answer] and [options].
  ///
  /// [answer] is the correct option among the list of options.
  /// [options] is the list of choices presented to the user, which should include the answer.
  RandomPickResult(this.answer, this.options);
}