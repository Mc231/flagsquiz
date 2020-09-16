import 'package:flagsquiz/models/continent.dart';
import 'package:flagsquiz/ui/continents/continents_screen.dart';
import 'package:flagsquiz/ui/flags_quiz_app.dart';
import 'package:flagsquiz/ui/option_button.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Option button has a title', (WidgetTester tester) async {
    // Given
    final continetsCount = Continent.values.length - 1;
    await tester.pumpWidget(
        FlagsQuizApp(homeWidget: ContinentsScreen()));
    // When
    await tester.pump();
    final optionButtonsFinder = find.byType(OptionButton);
    // Then
    expect(optionButtonsFinder, findsNWidgets(continetsCount));
  });
}