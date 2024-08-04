import 'game_state.dart';

/// A state representing the loading phase of the game.
///
/// This class extends `GameState` and represents the initial phase where
/// game assets or data are being loaded. Once loading is complete, the
/// game can transition to another state, such as `QuestionState`.
class LoadingState extends GameState {}