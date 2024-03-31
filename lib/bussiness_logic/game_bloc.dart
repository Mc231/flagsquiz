import 'package:flagsquiz/foundation/random_item_picker.dart';
import 'package:flagsquiz/bussiness_logic/countries_data_source.dart';
import 'package:flagsquiz/foundation/random_pick_result.dart';
import 'package:flagsquiz/foundation/single_subscription_bloc.dart';
import 'package:flagsquiz/models/answer.dart';
import 'package:flagsquiz/models/continent.dart';
import 'package:flagsquiz/models/country.dart';
import 'package:flagsquiz/models/question.dart';

import 'countries_provider.dart';
import 'game_state/game_state.dart';
import 'game_state/loading_state.dart';
import 'game_state/question_state.dart';

class GameBloc extends SingleSubscriptionBloc<GameState> {
  final Continent continent;
  final CountriesProvider provider;
  final RandomItemPicker<Country> randomItemPicker;

  late Function(String result) gameOverCallback;

  late CountriesDataSource _dataSource;
  List<Country> _countries = [];
  int _currentProgress = 0;
  int _totalCount = 0;
  late Question<Country> _currentQuestion;
  final List<Answer> _answers = [];

  GameBloc(this.continent, this.provider, this.randomItemPicker);

  factory GameBloc.standard(Continent continent) {
    return GameBloc(
        continent, CountriesProvider.standard(), RandomItemPicker([]));
  }

  @override
  GameState get initialState => LoadingState();

  /// Called when screen is loaded
  void performInitialLoad() async {
    var countries = await provider.provide();
    _dataSource = CountriesDataSource(countries);
    _countries = _dataSource.getByContinent(continent);
    _totalCount = _countries.length;
    randomItemPicker.replaceItems(_countries);
    _pickQuestion();
  }

  void processAnswer(Country country) {
    var answer = Answer(country, _currentQuestion);
    _answers.add(answer);
    _currentProgress++;
    _pickQuestion();
  }

  void _pickQuestion() {
    var randomResult = randomItemPicker.pick();
    if (randomResult != null) {
      if (_isGameOver(randomResult)) {
        var state =
        QuestionState(_currentQuestion, _currentProgress, _totalCount);
        dispatchState(state);
        _notifyGameOver();
      } else {
        var question = Question.fromRandomResult(randomResult);
        _currentQuestion = question;
        var state = QuestionState(question, _currentProgress, _totalCount);
        dispatchState(state);
      }
    }
  }

  bool _isGameOver(RandomPickResult result) => result == null;

  void _notifyGameOver() {
    var count = 0;
    for (var answer in _answers) {
      count += answer.isCorrect ? 1 : 0;
    }
    var result = '$count / $_totalCount';
    if (gameOverCallback != null) {
      gameOverCallback(result);
    }
    print('Your result is $result');
  }
}
