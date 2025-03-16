import 'package:flags_quiz/models/continent.dart';
import 'package:flags_quiz/models/country.dart';
import 'package:flags_quiz/ui/flags_quiz_app.dart';
import 'package:flags_quiz/ui/components/option_button.dart';
import 'package:flags_quiz/ui/quiz/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:quiz_engine_core/quiz_engine_core.dart';

@GenerateNiceMocks([MockSpec<RandomItemPicker>()])
import 'quiz_screen_test.mocks.dart';

void main() {
  late RandomItemPicker randomItemPicker;
  late QuizBloc bloc;

  Future<List<QuestionEntry>> loadCountriesForContinent(
      Continent continent) async {
    final provider = QuizDataProvider<Country>.standard(
        'assets/Countries.json', (data) => Country.fromJson(data, (_) => "Test"));

    final countries = await provider.provide();

    return (continent == Continent.all
            ? countries
            : countries
                .where((country) => country.continent == continent)
                .toList())
        .map((country) => country.toQuestionEntry)
        .toList();
  }

  setUp(() {
    randomItemPicker = MockRandomItemPicker();
    bloc = QuizBloc(
        () => loadCountriesForContinent(Continent.sa), randomItemPicker);
  });

  testWidgets('Question showing', (WidgetTester tester) async {
    // Given
    final country1 = Country.fromJson(
        {'name': 'Argentina', 'continent': 'SA', 'code': 'AR'}, (_) => "Argentina").toQuestionEntry;
    final country2 =
        Country.fromJson({'name': 'Bolivia', 'continent': 'SA', 'code': 'BO'}, (_) => "Bolivia").toQuestionEntry;
    final countries = [country1, country2];
    final randomPickResult = RandomPickResult(countries.first, countries);
    // When
    when(randomItemPicker.pick()).thenReturn(randomPickResult);
    await tester.pumpWidget(
      FlagsQuizApp(
          homeWidget: BlocProvider(
              bloc: bloc,
              child: QuizScreen(
                title: "Test",
              ))),
    );
    await tester.pump();
    await tester.pump();
    // Then
    final optionButtonFinder = find.byType(OptionButton);
    final imageFinder = find.byType(Image);
    expect(optionButtonFinder, findsNWidgets(countries.length));
    expect(imageFinder, findsOneWidget);
  });

  testWidgets('Quiz over dialog', (WidgetTester tester) async {
    // Given
    final countries = [
      Country.fromJson({'name': 'Argentina', 'continent': 'SA', 'code': 'AR'}, (_) => "Argentina").toQuestionEntry,
      Country.fromJson({'name': 'Bolivia', 'continent': 'SA', 'code': 'BO'}, (_) => "Bolivia").toQuestionEntry
    ];
    final bloc2 = QuizBloc(
            () => Future.value(countries), randomItemPicker);
    bloc2.currentQuestion = Question(countries.first, countries);
    // When
    when(randomItemPicker.pick()).thenReturn(null);
    await tester.pumpWidget(
      FlagsQuizApp(
          homeWidget: BlocProvider(
              bloc: bloc2,
              child: QuizScreen(
                title: "Test",
              ))),
    );
    await tester.pump();
    await tester.pump();
    // Then
    // Wait for game over dialog
    final alertDialogFinder = find.byType(AlertDialog);
    expect(alertDialogFinder, findsOneWidget);
    // Tap alert button
    final alertButtonFinder = find.byType(TextButton);
    expect(alertButtonFinder, findsOneWidget);
    await tester.tap(alertButtonFinder);
    await tester.pump();
    // Check that alert disappear
    final alertDisappearFinder = find.byType(AlertDialog);
    expect(alertDisappearFinder, findsNothing);
  });
}
