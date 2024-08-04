import 'package:flags_quiz/models/country.dart';
import 'package:flags_quiz/models/question.dart';

/// Represents an answer to a quiz question.
///
/// The `Answer` class encapsulates a user's selected option for a given
/// quiz question. It provides a method to check if the selected option
/// is correct by comparing it with the correct answer from the `Question`
/// object. This class is useful in quiz or game applications where users
/// select answers to multiple-choice questions.
///
/// Example usage:
/// ```dart
/// Country selectedCountry = Country(name: 'France');
/// Question question = Question(answer: Country(name: 'France'), options: [selectedCountry, ...]);
///
/// Answer answer = Answer(selectedCountry, question);
/// print('Is the answer correct? ${answer.isCorrect}'); // Output: Is the answer correct? true
/// ```
class Answer {
  /// The option selected by the user.
  final Country selectedOption;

  /// The question for which the answer is provided.
  final Question question;

  /// Creates an `Answer` with the given [selectedOption] and [question].
  ///
  /// [selectedOption] is the country chosen by the user as their answer.
  /// [question] is the question object that includes the correct answer
  /// and other options.
  Answer(this.selectedOption, this.question);

  /// Checks if the selected option is the correct answer.
  ///
  /// This getter compares the [selectedOption] with the correct answer
  /// in the [question]. It returns `true` if the selected option matches
  /// the correct answer, and `false` otherwise.
  bool get isCorrect => question.answer == selectedOption;
}