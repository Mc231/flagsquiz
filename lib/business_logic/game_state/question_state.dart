import 'package:flags_quiz/models/country.dart';
import 'package:flags_quiz/models/question.dart';
import 'game_state.dart';

/// A state representing the question phase of the game.
///
/// This class extends `GameState` and is used when the player is
/// answering a question. It holds information about the current question,
/// the player's progress, and the total number of questions.
///
/// The `QuestionState` calculates the percentage of progress made
/// through the questions, which can be used for displaying a progress bar
/// or other UI elements.
///
class QuestionState extends GameState {
  /// The current question being presented to the player.
  final Question<Country> question;

  /// The number of questions the player has answered so far.
  final int progress;

  /// The total number of questions in the game.
  final int total;

  /// Computes the percentage of progress made through the questions.
  ///
  /// This is a value between 0 and 1 representing the fraction of
  /// questions completed.
  double get percentageProgress => (progress / total).toDouble();

  /// Creates a new `QuestionState` with the given question, progress, and total.
  ///
  /// [question] is the current question for the player.
  /// [progress] is the number of questions answered so far.
  /// [total] is the total number of questions in the game.
  QuestionState(this.question, this.progress, this.total);
}