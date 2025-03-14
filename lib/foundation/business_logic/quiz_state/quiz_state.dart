import '../../model/question.dart';

/// An abstract class representing the state of a quiz.
///
/// This class is **fully generic**, meaning it can work with any type of quiz data (`T`).
/// It serves as a base type for managing different states within the quiz.
sealed class QuizState<T> {
  factory QuizState.loading() = LoadingState<T>;
  factory QuizState.question(Question<T> question, int progress, int total) = QuestionState<T>;
  const QuizState();
}

/// A state representing the loading phase of the quiz.
class LoadingState<T> extends QuizState<T> {}

/// A state representing the question phase of the quiz.
///
/// This class is **generic**, meaning it can handle any type of question (`T`).
class QuestionState<T> extends QuizState<T> {
  /// The current question being presented to the player.
  final Question<T> question;

  /// The number of questions the player has answered so far.
  final int progress;

  /// The total number of questions in the game.
  final int total;

  /// Computes the percentage of progress made through the quiz.
  double get percentageProgress => total == 0 ? 0 : (progress / total).toDouble();

  /// Creates a new `QuestionState<T>` with the given question, progress, and total.
  QuestionState(this.question, this.progress, this.total);
}