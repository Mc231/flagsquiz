import 'package:flags_quiz/business_logic/countries_provider.dart';
import 'package:flags_quiz/business_logic/game_bloc.dart';
import 'package:flags_quiz/business_logic/game_state/loading_state.dart';
import 'package:flags_quiz/business_logic/game_state/question_state.dart';
import 'package:flags_quiz/foundation/random_item_picker.dart';
import 'package:flags_quiz/foundation/random_pick_result.dart';
import 'package:flags_quiz/models/continent.dart';
import 'package:flags_quiz/models/country.dart';
import 'package:flags_quiz/models/question.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<CountriesProvider>(), MockSpec<RandomItemPicker<Country>>()])
import 'game_bloc_test.mocks.dart';

void main() {
  late GameBloc bloc;
  late CountriesProvider provider;
  late RandomItemPicker<Country> randomItemPicker;

  List<Country> countries = [];

  setUp(() {
    provider = MockCountriesProvider();
    randomItemPicker = MockRandomItemPicker();
    bloc = GameBloc(Continent.all, provider, randomItemPicker);
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
    final continent = Continent.af;
    // When
    final result = GameBloc.standard(continent);
    // Then
    expect(result, isNotNull);
  });


  test('initial state is correct', () {
    expect(bloc.initialState, isInstanceOf<LoadingState>());
  });

  test('initial load called correctly', () {
    when(randomItemPicker.pick()).thenAnswer((_) => RandomPickResult(countries.first, countries));
    when(provider.provide())
        .thenAnswer((realInvocation) => Future.value(countries));
    bloc.performInitialLoad();
    expect(bloc.stream, emitsInOrder([isInstanceOf<QuestionState>()]));
  });

  test('process answer', () {
    // Given
    final question = Question(countries.first, countries);
    bloc.currentQuestion = question;
    countries.removeLast();
    final randomPickResult = RandomPickResult(countries.first, countries);
    // When
    when(randomItemPicker.pick())
        .thenAnswer((realInvocation) => randomPickResult);
     bloc.processAnswer(countries.first);
    // Then
    expect(bloc.stream, emitsInOrder([isInstanceOf<QuestionState>()]));
  });

  test('process game over', () {
    // Given
    final answer = countries.first;
    final expectedScore = '0 / 0';
    bloc.currentQuestion = Question(countries.last, countries);
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