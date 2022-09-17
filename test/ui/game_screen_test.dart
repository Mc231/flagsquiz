import 'package:flagsquiz/bussiness_logic/countries_provider.dart';
import 'package:flagsquiz/bussiness_logic/game_bloc.dart';
import 'package:flagsquiz/foundation/bloc_provider.dart';
import 'package:flagsquiz/foundation/random_item_picker.dart';
import 'package:flagsquiz/foundation/random_pick_result.dart';
import 'package:flagsquiz/models/continent.dart';
import 'package:flagsquiz/models/country.dart';
import 'package:flagsquiz/ui/flags_quiz_app.dart';
import 'package:flagsquiz/ui/game/game_screen.dart';
import 'package:flagsquiz/ui/option_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class CountriesProviderMock extends Mock implements CountriesProvider {}

class RandomItemPickerMock extends Mock implements RandomItemPicker<Country> {}

void main() {
  Continent continent;
  CountriesProvider countriesProvider;
  RandomItemPicker<Country> randomItemPicker;
  GameBloc bloc;

  setUp(() {
    continent = Continent.sa;
    countriesProvider = CountriesProviderMock();
    randomItemPicker = RandomItemPickerMock();
    bloc = GameBloc(continent, countriesProvider, randomItemPicker);
  });

  tearDown(() {
    continent = null;
    countriesProvider = null;
    randomItemPicker = null;
    bloc = null;
  });

  testWidgets('Progress indicator showing', (WidgetTester tester) async {
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
    // Then
    final progressIndicatorFinder = find.byType(CircularProgressIndicator);
    expect(progressIndicatorFinder, findsOneWidget);
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
    // When
    when(randomItemPicker.replaceItems([])).thenReturn(countries);
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
