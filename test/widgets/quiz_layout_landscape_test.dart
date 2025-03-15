import 'package:flags_quiz/ui/flags_quiz_app.dart';
import 'package:flags_quiz/ui/quiz/quiz_answers_widget.dart';
import 'package:flags_quiz/ui/quiz/quiz_image_widget.dart';
import 'package:flags_quiz/ui/quiz/quiz_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_engine_core/quiz_engine_core.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flags_quiz/models/country.dart';

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
        homeWidget: QuizLayout(
          questionState: mockQuestionState,
          information: sizingInformation,
          processAnswer: (_) {},
        ),
      ));

      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(QuizImageWidget), findsOneWidget);
      expect(find.byType(QuizAnswersWidget), findsOneWidget);
    });
  });
}
