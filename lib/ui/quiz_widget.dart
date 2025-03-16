import 'package:flags_quiz/ui/quiz/quiz_screen.dart';
import 'package:flags_quiz/ui/quiz_widget_entry.dart';
import 'package:flutter/material.dart';
import 'package:quiz_engine_core/quiz_engine_core.dart';

/// A reusable widget that encapsulates the quiz logic.
///
/// This widget initializes the `QuizBloc` and provides a quiz interface
/// for any dataset that matches the `QuestionEntry` model.
///
/// Usage:
/// ```dart
/// QuizWidget(
///   title: "Flags Quiz",
///   dataProvider: () async => loadCountriesForContinent(Continent.europe),
/// );
/// ```
class QuizWidget extends StatelessWidget {
  final QuizWidgetEntry quizEntry;

  const QuizWidget({super.key, required this.quizEntry});

  @override
  Widget build(BuildContext context) {
    final bloc = QuizBloc(quizEntry.dataProvider, RandomItemPicker([]));

    return BlocProvider(
      bloc: bloc,
      child: QuizScreen(
          title: quizEntry.title, gameOverTitle: quizEntry.gameOverText),
    );
  }
}
