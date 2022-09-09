import 'package:flagsquiz/ui/flags_quiz_app.dart';
import 'package:flagsquiz/ui/option_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Option button has a title', (WidgetTester tester) async {
    // Given
    final title = 'Title';
    // When
    await tester.pumpWidget(
      FlagsQuizApp(
          homeWidget: OptionButton(title: title, onClickListener: null)),
    );
    await tester.pump();
    // Then
    final titleFinder = find.text(title);
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('Option button click works', (WidgetTester tester) async {
    // Given
    var buttonClicked = false;
    await tester.pumpWidget(FlagsQuizApp(
        homeWidget: OptionButton(
            title: '',
            onClickListener: () {
              buttonClicked = true;
            })));
    await tester.pump();
    // When
    await tester.tap(find.byType(OptionButton));
    // Then
    expect(buttonClicked, equals(true));
  });
}
