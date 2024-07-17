import 'package:flagsquiz/models/continent.dart';
import 'package:flagsquiz/ui/continents/continents_screen.dart';
import 'package:flagsquiz/ui/flags_quiz_app.dart';
import 'package:flagsquiz/ui/option_button.dart';
import 'package:flutter_test/flutter_test.dart';

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
    await tester.pump();
    // Then
   // final gameScreenFinder = find.byType(GameScreen);
    // TODO: - Figure out this
    //expect(gameScreenFinder, findsOneWidget);
  });
}
