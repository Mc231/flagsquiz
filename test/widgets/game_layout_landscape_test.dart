import 'package:flags_quiz/foundation/business_logic/quiz_state/quiz_state.dart';
import 'package:flags_quiz/foundation/model/question.dart';
import 'package:flags_quiz/ui/flags_quiz_app.dart';
import 'package:flags_quiz/ui/game/game_answers_widget.dart';
import 'package:flags_quiz/ui/game/game_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flags_quiz/models/country.dart';
import 'package:flags_quiz/ui/game/game_layout.dart';

void main() {
  group('GameLayout', () {
    Country mockCountry =
        Country.fromJson({"name": "Test", "continent": "EU", "code": "ua"});
    QuestionState<Country> mockQuestionState =
        QuestionState(Question<Country>(mockCountry, [mockCountry]), 1, 1);

    testWidgets('displays correctly in landscape orientation',
        (WidgetTester tester) async {
      final sizingInformation = SizingInformation(
        deviceScreenType: DeviceScreenType.mobile,
        refinedSize: RefinedSize.normal,
        screenSize: Size(800, 600),
        localWidgetSize: Size(800, 600),
      );

      await tester.pumpWidget(FlagsQuizApp(
        homeWidget: GameLayout(
          questionState: mockQuestionState,
          information: sizingInformation,
          processAnswer: (_) {},
        ),
      ));

      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(GameImageWidget), findsOneWidget);
      expect(find.byType(GameAnswersWidget), findsOneWidget);
    });
  });
}
