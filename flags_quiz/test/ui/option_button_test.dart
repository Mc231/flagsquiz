import 'package:flagsquiz/ui/option_button.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_app.dart';

void main() {
  testWidgets('Option button has a title', (WidgetTester tester) async {
    // Given
    final title = 'Title';
    var buttonClicked = false;
    // When
    await tester.pumpWidget(
        TestApp(child: OptionButton(title: title, onClickListener: null)));
    // Then
     final titleFinder = find.text(title);
     expect(titleFinder, findsOneWidget);
  });

  testWidgets('Option button click works', (WidgetTester tester) async {
    // Given
    var buttonClicked = false;
    await tester.pumpWidget(
        TestApp(child: OptionButton(title: '', onClickListener: () {
          buttonClicked = true;
        })));
    // When
    await tester.tap(find.byType(OptionButton));
    // Then
    expect(buttonClicked, equals(true));
  });
}


