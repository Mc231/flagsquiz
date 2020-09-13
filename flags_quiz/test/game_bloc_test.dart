import 'package:flagsquiz/bussiness_logic/countries_provider.dart';
import 'package:flagsquiz/bussiness_logic/game_bloc.dart';
import 'package:flagsquiz/bussiness_logic/game_state/game_state.dart';
import 'package:flagsquiz/foundation/random_item_picker.dart';
import 'package:flagsquiz/foundation/random_pick_result.dart';
import 'package:flagsquiz/models/continent.dart';
import 'package:flagsquiz/models/country.dart';
import 'package:flagsquiz/models/question.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class CountriesProviderMock extends Mock implements CountriesProvider {}

class RandomItemPickerMock extends Mock implements RandomItemPicker<Country> {}

void main() {
  GameBloc bloc;
  CountriesProvider provider;
  RandomItemPicker<Country> randomItemPicker;

  List<Country> countries;

  setUp(() {
    provider = CountriesProviderMock();
    randomItemPicker = RandomItemPickerMock();
    bloc = GameBloc(null, provider, randomItemPicker);
    countries = [
      Country.fromJson({'name': 'Ukraine', 'continent': 'EU', 'code': 'UK'}),
      Country.fromJson({'name': 'Poland', 'continent': 'EU', 'code': 'PL'}),
      Country.fromJson({'name': 'Slovakia', 'continent': 'EU', 'code': 'SK'}),
      Country.fromJson({'name': 'Romania', 'continent': 'EU', 'code': 'RO'}),
      Country.fromJson({'name': 'Belarus', 'continent': 'EU', 'code': 'BY'}),
    ];
  });

  tearDown(() {
    bloc.dispose();
  });

  test('init standard', () {
    // Given
    final continent = Continent.AF;
    // When
    final result = GameBloc.standard(continent);
    // Then
    expect(result, isNotNull);
  });


  test('initial state is correct', () {
    expect(bloc.initialState, isInstanceOf<LoadingState>());
  });

  test('initial load called correctly', () {
    when(provider.provide())
        .thenAnswer((realInvocation) => Future.value(countries));
    bloc.performInitialLoad();
    expect(bloc.stream, emitsInOrder([isInstanceOf<QuestionState>()]));
  });

  test('process answer', () {
    // Given
    final question = Question(countries.first, countries);
    final expectedState = QuestionState(question, 0, countries.length);
    countries.removeLast();
    final randomPickResult = RandomPickResult(countries.first, countries);
    // When
    when(randomItemPicker.pick())
        .thenAnswer((realInvocation) => randomPickResult);
     bloc.processAnswer(countries.first);
    // Then
    // TODO: - Figure out how to correctly test emmits in order
    expect(bloc.stream, emitsInOrder([isInstanceOf<QuestionState>()]));
  });

  test('process game over', () {
    // Given
    final answer = countries.first;
    final expectedScore = '0 / 0';
    bloc.gameOverCallback = (score) {
      // Then
      expect(score, equals(expectedScore));
      expect(bloc.stream, emitsInOrder([isInstanceOf<QuestionState>()]));
    };
    // When
    when(randomItemPicker.pick())
        .thenAnswer((realInvocation) => null);
    bloc.processAnswer(answer);
  });
}