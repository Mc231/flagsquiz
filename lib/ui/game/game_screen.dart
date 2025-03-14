import 'package:flags_quiz/foundation/bloc/bloc_provider.dart';
import 'package:flags_quiz/foundation/business_logic/quiz_state/quiz_state.dart';
import 'package:flags_quiz/models/country.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../foundation/business_logic/game_bloc.dart';
import 'game_layout.dart';

/// A screen that displays the game interface, handling questions and user interaction.
///
/// The `GameScreen` class is a `StatefulWidget` that provides the main interface for the quiz or game.
/// It manages the game state using a BLoC (Business Logic Component) pattern and updates the UI
/// based on the current state. The screen includes a question display, answer options, and a progress indicator.
/// It also shows a game over dialog when the quiz is complete.
///
/// The widget relies on `GameBloc` to manage the game logic and state transitions. The `BlocProvider`
/// is used to access the BLoC instance and manage its lifecycle.
///
/// The `GameScreen` uses a responsive design to adapt to different screen sizes and orientations,
/// ensuring a consistent experience across devices.
///
///
class GameScreen extends StatefulWidget {
  /// Key used for identifying the OK button in the game over dialog.
  static const okButtonKey = Key("ok_button");

  final String title;

  const GameScreen({super.key, required this.title});

  @override
  State<StatefulWidget> createState() {
    return GameScreenState();
  }
}

/// The state for the `GameScreen`, managing the game logic and UI updates.
class GameScreenState extends State<GameScreen> {
  /// The BLoC managing the game logic and state transitions.
  late GameBloc<Country> _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<GameBloc<Country>>(context);
    _bloc.performInitialLoad();
    _bloc.gameOverCallback = (String result) {
      _showGameOverDialog(result);
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: getContainerPadding(context),
        child: SafeArea(
            child: StreamBuilder<QuizState>(
              initialData: _bloc.initialState,
              stream: _bloc.stream,
              builder: (context, snapshot) {
                var state = snapshot.data;
                if (state is LoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final questionState = state as QuestionState<Country>;
                return ResponsiveBuilder(builder: (context, information) {
                  return GameLayout(
                      questionState: questionState,
                      information: information,
                      processAnswer: _bloc.processAnswer);
                });
              },
            )),
      ),
    );
  }

  /// Displays a dialog indicating the game is over, showing the final score.
  ///
  /// This method is called when the game is completed, presenting a dialog
  /// with the user's score. The dialog is non-dismissible, requiring the user
  /// to tap the OK button to close it.
  ///
  /// [message] is the score message to display in the dialog.
  void _showGameOverDialog(String message) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)?.yourScore ?? ""),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(MaterialLocalizations.of(context).okButtonLabel,
                  key: GameScreen.okButtonKey),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    Navigator.of(context).pop();
  }
}

/// Extension on `GameScreenState` to provide responsive layout utilities.
extension GameScreenSizes on GameScreenState {
  /// Returns the container padding based on the screen size.
  ///
  /// This method calculates padding for the game screen using `getValueForScreenType`,
  /// adjusting the padding for mobile, tablet, desktop, and watch screen sizes.
  ///
  /// [context] is the `BuildContext` used to determine the screen size.
  ///
  /// Returns the `EdgeInsets` for the container padding.
  EdgeInsets getContainerPadding(BuildContext context) {
    var padding = getValueForScreenType<double>(
        context: context, mobile: 16, tablet: 16, desktop: 16, watch: 8);
    return EdgeInsets.all(padding);
  }
}