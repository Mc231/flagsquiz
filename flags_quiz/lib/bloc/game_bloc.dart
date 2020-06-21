import 'package:flagsquiz/bloc/random_countries_picker.dart';
import 'package:flagsquiz/countries_data_source.dart';
import 'package:flagsquiz/countries_provider.dart';
import 'package:flagsquiz/foundation/single_subscription_bloc.dart';
import 'package:flagsquiz/models/answer.dart';
import 'package:flagsquiz/models/continent.dart';
import 'package:flagsquiz/models/country.dart';
import 'package:flagsquiz/models/question.dart';

abstract class GameState {}

class LoadingState extends GameState {}

class QuestionState extends GameState {
  final Question question;
  final int progress;
  final int total;

  double get percentageProgress => (progress / total).toDouble();

  QuestionState(this.question, this.progress, this.total);
}

class GameBloc extends SingleSubscriptionBloc<GameState> {
  final Continent continent;
  final CountriesProvider provider;
  CountriesDataSource dataSource;
  RandomCountriesPicker randomPicker;

  List<Country> _countries = [];
  int _currentProgress = 0;
  int _totalCount = 0;
  Question _currentQuestion;
  final List<Answer> _answers = [];

  GameBloc(this.continent, [this.provider = const CountriesProvider()]);

  /// Called when screen is loaded
  void initialLoad() async {
    var countries = await provider.provide();
    dataSource = CountriesDataSource(countries);
    _countries = dataSource.getByContinent(continent);
    _totalCount = _countries.length;
    randomPicker = RandomCountriesPicker(_countries);
    generateQuestion();
  }

  void generateQuestion() {
    var randomResult = randomPicker.pick();
    if (randomResult == null) {
      var state =
          QuestionState(_currentQuestion, _currentProgress, _totalCount);
      dispatchState(state);
      handleGameOver();
      return;
    }
    var question = Question.fromRandomResult(randomResult);
    _currentQuestion = question;
    var state = QuestionState(question, _currentProgress, _totalCount);
    dispatchState(state);
  }

  void answerQuestion(Country country) {
    var answer = Answer(country, _currentQuestion);
    _answers.add(answer);
    _currentProgress++;
    generateQuestion();
  }

  void handleGameOver() {
    var count = 0;
    for (var answer in _answers) {
      count += answer.isCorrect ? 1 : 0;
    }
    print('Your result is ${count} / $_totalCount');
  }

  @override
  GameState get initialState => LoadingState();
}
