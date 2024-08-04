import 'package:flags_quiz/models/country.dart';
import 'package:flags_quiz/ui/flags_quiz_app.dart';
import 'package:flags_quiz/ui/game/game_answers_widget.dart';
import 'package:flags_quiz/ui/components/option_button.dart';
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
        localWidgetSize: Size.square(200),
        refinedSize: RefinedSize.small);
    Country? tappedAnswer;
    await tester.pumpWidget(
      FlagsQuizApp(
          homeWidget: GameAnswersWidget(
              options: options,
              sizingInformation: sizingInformation,
              answerClickListener: (answer) {
                tappedAnswer = answer;
              }, key: Key("Test"),)),
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
