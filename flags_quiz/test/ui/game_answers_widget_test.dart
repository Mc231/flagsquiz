import 'package:flagsquiz/models/country.dart';
import 'package:flagsquiz/ui/flags_quiz_app.dart';
import 'package:flagsquiz/ui/game/game_answers_widget.dart';
import 'package:flagsquiz/ui/option_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  testWidgets('Game answers widget handle tap', (WidgetTester tester) async {
    // Given
    final expectedAnswer = Country.fromJson(
        {'name': 'Antigua and Barbuda', 'continent': 'NA', 'code': 'AG'});
    final options = [expectedAnswer];
    final sizingInformation = SizingInformation(
        deviceScreenType: DeviceScreenType.mobile,
        screenSize: Size.square(200),
        localWidgetSize: Size.square(200));
    var tappedAnswer;
    await tester.pumpWidget(
      FlagsQuizApp(
          homeWidget: GameAnswersWidget(
              options: options,
              sizingInformation: sizingInformation,
              answerClickListener: (answer) {
                tappedAnswer = answer;
              })),
    );
    await tester.pump();
    final buttonFinder = find.byType(OptionButton);
    expect(buttonFinder, findsNWidgets(options.length));
    // When
    await tester.tap(buttonFinder);
    // Then
    expect(expectedAnswer, tappedAnswer);
  });
}
