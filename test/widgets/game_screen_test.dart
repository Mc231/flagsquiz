import 'package:flags_quiz/business_logic/countries_provider.dart';
import 'package:flags_quiz/business_logic/game_bloc.dart';
import 'package:flags_quiz/foundation/bloc_provider.dart';
import 'package:flags_quiz/foundation/random_item_picker.dart';
import 'package:flags_quiz/foundation/random_pick_result.dart';
import 'package:flags_quiz/models/continent.dart';
import 'package:flags_quiz/models/country.dart';
import 'package:flags_quiz/models/question.dart';
import 'package:flags_quiz/ui/flags_quiz_app.dart';
import 'package:flags_quiz/ui/game/game_screen.dart';
import 'package:flags_quiz/ui/components/option_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<CountriesProvider>(), MockSpec<RandomItemPicker<Country>>()])
import 'game_screen_test.mocks.dart';

void main() {
  late Continent continent;
  late CountriesProvider countriesProvider;
  late RandomItemPicker<Country> randomItemPicker;
  late GameBloc bloc;

  setUp(() {
    continent = Continent.sa;
    countriesProvider = MockCountriesProvider();
    randomItemPicker = MockRandomItemPicker();
    bloc = GameBloc(continent, countriesProvider, randomItemPicker);
  });

  testWidgets('Question showing', (WidgetTester tester) async {
    // Given
    final country1 = Country.fromJson(
        {'name': 'Argentina', 'continent': 'SA', 'code': 'AR'});
    final country2 =
    Country.fromJson({'name': 'Bolivia', 'continent': 'SA', 'code': 'BO'});
    final countries = [country1, country2];
    final randomPickResult = RandomPickResult(countries.first, countries);
    // When
    when(randomItemPicker.pick()).thenReturn(randomPickResult);
    when(countriesProvider.provide())
        .thenAnswer((_) => Future.value(countries));
    await tester.pumpWidget(
      FlagsQuizApp(homeWidget: BlocProvider(bloc: bloc, child: GameScreen())),
    );
    await tester.pump();
    await tester.pump();
    // Then
    final optionButtonFinder = find.byType(OptionButton);
    final imageFinder = find.byType(Image);
    expect(optionButtonFinder, findsNWidgets(countries.length));
    expect(imageFinder, findsOneWidget);
  });

  testWidgets('Game over dialog', (WidgetTester tester) async {
    // Given
    final countries = [Country.fromJson(
        {'name': 'Argentina', 'continent': 'SA', 'code': 'AR'}),
      Country.fromJson({'name': 'Bolivia', 'continent': 'SA', 'code': 'BO'})
    ];
    bloc.currentQuestion = Question(countries.first, countries);
    // When
    when(randomItemPicker.replaceItems([])).thenAnswer((_) => countries);
    when(countriesProvider.provide())
        .thenAnswer((_) => Future.value(countries));
    await tester.pumpWidget(
      FlagsQuizApp(homeWidget: BlocProvider(bloc: bloc, child: GameScreen())),
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
