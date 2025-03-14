import 'package:flags_quiz/foundation/business_logic/quiz_state/quiz_state.dart';
import 'package:flags_quiz/foundation/random_item_picker.dart';
import 'package:flags_quiz/foundation/model/random_pick_result.dart';
import 'package:flags_quiz/foundation/bloc/single_subscription_bloc.dart';
import 'package:flags_quiz/foundation/model/answer.dart';
import '../model/question.dart';
import 'quiz_data_provider.dart';

/// A business logic component (BLoC) that manages the state of a quiz game.
///
/// The `GameBloc<T>` class is **fully generic**, supporting any type of quiz
/// content (e.g., `Country`, `String`, `int`, etc.). It loads data, processes
/// questions, evaluates answers, and tracks game progress.
///
/// This class **does not depend on any specific data type**.
class GameBloc<T> extends SingleSubscriptionBloc<QuizState> {
  /// The provider used to load quiz data.
  final QuizDataProvider<T> provider;

  /// The random item picker used to select random items for questions.
  final RandomItemPicker<T> randomItemPicker;

  /// A filter function to apply when loading data (optional).
  final bool Function(T)? filter;

  /// Callback function to be invoked when the game is over.
   Function(String result)? gameOverCallback;

  /// The list of quiz data items available for the game.
  List<T> _items = [];

  /// The current progress indicating how many questions have been answered.
  int _currentProgress = 0;

  /// The total number of questions in the game.
  int _totalCount = 0;

  /// The current question being asked to the player.
  late Question<T> currentQuestion;

  /// The list of answers provided by the player.
  final List<Answer<T>> _answers = [];

  /// Creates a `GameBloc` with the specified provider, item picker, and optional filter.
  GameBloc(this.provider, this.randomItemPicker, {this.filter});

  /// Creates a standard `GameBloc` for any type with default settings.
  factory GameBloc.standard(
      String jsonPath, T Function(Map<String, dynamic>) fromJson,
      {bool Function(T)? filter}) {
    return GameBloc<T>(
      QuizDataProvider<T>.standard(jsonPath, fromJson),
      RandomItemPicker([]),
      filter: filter,
    );
  }

  /// The initial state of the game, set to loading.
  @override
  QuizState get initialState => QuizState.loading();

  /// Performs the initial data load when the screen is loaded.
  ///
  /// This method retrieves quiz data from the provider, applies the optional filter,
  /// and initializes the random picker.
  void performInitialLoad() async {
    var items = await provider.provide();

    // Apply filter if provided, otherwise keep all items
    _items = filter != null ? items.where(filter!).toList() : items;

    _totalCount = _items.length;
    randomItemPicker.replaceItems(_items);
    _pickQuestion();
  }

  /// Processes the player's answer to the current question.
  void processAnswer(T selectedItem) {
    var answer = Answer<T>(selectedItem, currentQuestion);
    _answers.add(answer);
    _currentProgress++;
    _pickQuestion();
  }

  /// Picks the next question or ends the game if no more items are available.
  void _pickQuestion() {
    var randomResult = randomItemPicker.pick();
    if (_isGameOver(randomResult)) {
      var state =
          QuizState.question(currentQuestion, _currentProgress, _totalCount);
      dispatchState(state);
      _notifyGameOver();
    } else {
      var question = Question<T>.fromRandomResult(randomResult!);
      currentQuestion = question;
      var state = QuizState.question(question, _currentProgress, _totalCount);
      dispatchState(state);
    }
  }

  /// Determines if the game is over based on the random picker result.
  bool _isGameOver(RandomPickResult<T>? result) => result == null;

  /// Notifies the game-over state and invokes the callback with the final result.
  void _notifyGameOver() {
    var correctAnswers = _answers.where((answer) => answer.isCorrect).length;
    var result = '$correctAnswers / $_totalCount';
    gameOverCallback?.call(result);
  }
}
