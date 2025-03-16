import 'package:flags_quiz/models/continent.dart';
import 'package:flags_quiz/ui/continents/continents_screen.dart';
import 'package:flags_quiz/ui/flags_quiz_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_engine/quiz_engine.dart';

void main() {
  testWidgets('Continents screen contains all continents',
      (WidgetTester tester) async {
    // Given
    final continentsCount = Continent.values.length - 1;
    await tester.pumpWidget(FlagsQuizApp(homeWidget: ContinentsScreen()));
    // When
    await tester.pump();
    final optionButtonsFinder = find.byType(OptionButton);
    // Then
    expect(optionButtonsFinder, findsNWidgets(continentsCount));
  });

  testWidgets('Continents screen navigate to game',
      (WidgetTester tester) async {
    // Given
    await tester.pumpWidget(FlagsQuizApp(
      homeWidget: ContinentsScreen(),
    ));
    await tester.pump();
    // When
    final optionButtonsFinder = find.byType(OptionButton);
    expect(optionButtonsFinder, findsWidgets);
    await tester.tap(optionButtonsFinder.first);
    await tester.pumpAndSettle();
    // Then
    final scoreFinder = find.byWidgetPredicate((widget) =>
    widget is Text &&
        widget.data != null &&
        widget.data!.contains(RegExp(r'^\d+ / \d+$')));

    // Verify that the score text is found
    expect(scoreFinder, findsOneWidget);
  });
}
