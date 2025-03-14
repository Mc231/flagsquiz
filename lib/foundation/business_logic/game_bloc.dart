import 'package:flags_quiz/foundation/business_logic/quiz_state/quiz_state.dart';
import 'package:flags_quiz/foundation/random_item_picker.dart';
import 'package:flags_quiz/foundation/model/random_pick_result.dart';
import 'package:flags_quiz/foundation/bloc/single_subscription_bloc.dart';
import 'package:flags_quiz/foundation/model/answer.dart';
import 'package:flags_quiz/models/continent.dart';
import 'package:flags_quiz/models/country.dart';

import '../model/question.dart';
import 'countries_data_source.dart';
import 'countries_provider.dart';

/// A business logic component (BLoC) that manages the state of a flag quiz game.
///
/// The `GameBloc` class extends `SingleSubscriptionBloc` to handle the
/// different game states, including loading and question answering phases.
/// It coordinates data retrieval, question generation, answer processing,
/// and the end-of-game evaluation.
///
/// The game logic is structured around a set of countries from a specific
/// continent, randomly picked questions, and user-provided answers. The
/// BLoC pattern ensures that the UI reacts to state changes emitted by the BLoC.
///
/// Constructor:
/// - `GameBloc`: Initializes with a specific continent, countries provider,
///   and random item picker.
/// - `GameBloc.standard`: Provides a default setup with a standard countries
///   provider and random item picker.
///
/// Usage involves initializing the BLoC, performing initial data load,
/// processing user answers, and handling game completion.
class GameBloc extends SingleSubscriptionBloc<QuizState> {
  /// The continent used to filter countries for the game.
  final Continent continent;

  /// The provider used to load countries data.
  final CountriesProvider provider;

  /// The random item picker used to select random countries for questions.
  final RandomItemPicker<Country> randomItemPicker;

  /// Callback function to be invoked when the game is over.
  late Function(String result) gameOverCallback;

  /// The data source containing countries for the current game.
  late CountriesDataSource _dataSource;

  /// The list of countries available for the game, filtered by continent.
  List<Country> _countries = [];

  /// The current progress indicating how many questions have been answered.
  int _currentProgress = 0;

  /// The total number of questions in the game.
  int _totalCount = 0;

  /// The current question being asked to the player.
  late Question<Country> currentQuestion;

  /// The list of answers provided by the player.
  final List<Answer> _answers = [];

  /// Creates a `GameBloc` with the specified continent, provider, and item picker.
  GameBloc(this.continent, this.provider, this.randomItemPicker);

  /// Creates a standard `GameBloc` with default settings for the specified continent.
  factory GameBloc.standard(Continent continent) {
    return GameBloc(
        continent, CountriesProvider.standard(), RandomItemPicker([]));
  }

  /// The initial state of the game, set to loading.
  @override
  QuizState get initialState => QuizState.loading();

  /// Performs the initial data load when the screen is loaded.
  ///
  /// This method retrieves countries data from the provider, filters them by
  /// the specified continent, and initializes the random item picker with the
  /// available countries. It then picks the first question.
  void performInitialLoad() async {
    var countries = await provider.provide();
    _dataSource = CountriesDataSource(countries);
    _countries = _dataSource.getByContinent(continent);
    _totalCount = _countries.length;
    randomItemPicker.replaceItems(_countries);
    _pickQuestion();
  }

  /// Processes the player's answer to the current question.
  ///
  /// [country] is the player's selected country as the answer. The method
  /// records the answer, updates the progress, and picks the next question.
  void processAnswer(Country country) {
    var answer = Answer(country, currentQuestion);
    _answers.add(answer);
    _currentProgress++;
    _pickQuestion();
  }

  /// Picks the next question for the player or ends the game if no more questions.
  ///
  /// This method uses the `randomItemPicker` to select a new question randomly.
  /// If no more questions are available, it dispatches the final state and
  /// triggers the game-over callback.
  void _pickQuestion() {
    var randomResult = randomItemPicker.pick();
    if (_isGameOver(randomResult)) {
      var state =
      QuizState.question(currentQuestion, _currentProgress, _totalCount);
      dispatchState(state);
      _notifyGameOver();
    } else {
      var question = Question.fromRandomResult(randomResult!);
      currentQuestion = question;
      var state = QuizState.question(question, _currentProgress, _totalCount);
      dispatchState(state);
    }
  }

  /// Determines if the game is over based on the result of the random item picker.
  ///
  /// Returns `true` if no more questions can be picked, indicating the game is over.
  bool _isGameOver(RandomPickResult? result) => result == null;

  /// Notifies the game-over state and invokes the callback with the final result.
  ///
  /// The result is calculated as the number of correct answers out of the total.
  /// This method also prints the result to the console.
  void _notifyGameOver() {
    var count = 0;
    for (var answer in _answers) {
      count += answer.isCorrect ? 1 : 0;
    }
    var result = '$count / $_totalCount';
    gameOverCallback(result);
  }
}