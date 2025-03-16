import 'package:quiz_engine_core/quiz_engine_core.dart';

class QuizWidgetEntry {
  /// The title of the quiz.
  final String title;

  /// Game over text
  final String gameOverText;

  /// The function that provides quiz data.
  final Future<List<QuestionEntry>> Function() dataProvider;

  /// Creates a `QuizEntry` with the specified title, game over text, and data provider.
  QuizWidgetEntry({required this.title, required this.gameOverText, required this.dataProvider});
}