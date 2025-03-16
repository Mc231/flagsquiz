import 'package:flutter/material.dart';
import 'package:quiz_engine_core/quiz_engine_core.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'quiz_layout.dart';

/// A screen that displays the quiz interface, handling questions and user interaction.
///
/// The `QuizScreen` class is a `StatefulWidget` that provides the main interface for the quiz or quiz.
/// It manages the quiz state using a BLoC (Business Logic Component) pattern and updates the UI
/// based on the current state. The screen includes a question display, answer options, and a progress indicator.
/// It also shows a quiz over dialog when the quiz is complete.
///
/// The widget relies on `QuizBloc` to manage the quiz logic and state transitions. The `BlocProvider`
/// is used to access the BLoC instance and manage its lifecycle.
///
/// The `QuizScreen` uses a responsive design to adapt to different screen sizes and orientations,
/// ensuring a consistent experience across devices.
///
///
class QuizScreen extends StatefulWidget {
  /// Key used for identifying the OK button in the quiz over dialog.
  static const okButtonKey = Key("ok_button");

  final String title;
  final String gameOverTitle;

  const QuizScreen({super.key, required this.title, required this.gameOverTitle});

  @override
  State<StatefulWidget> createState() {
    return QuizScreenState();
  }
}

/// The state for the `QuizScreen`, managing the quiz logic and UI updates.
class QuizScreenState extends State<QuizScreen> {
  /// The BLoC managing the quiz logic and state transitions.
  late QuizBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<QuizBloc>(context);
    _bloc.performInitialLoad();
    _bloc.gameOverCallback = (String result) {
      _showQuizOverDialog(result);
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
                final questionState = state as QuestionState;
                return ResponsiveBuilder(builder: (context, information) {
                  return QuizLayout(
                      questionState: questionState,
                      information: information,
                      processAnswer: _bloc.processAnswer);
                });
              },
            )),
      ),
    );
  }

  /// Displays a dialog indicating the quiz is over, showing the final score.
  ///
  /// This method is called when the quiz is completed, presenting a dialog
  /// with the user's score. The dialog is non-dismissible, requiring the user
  /// to tap the OK button to close it.
  ///
  /// [message] is the score message to display in the dialog.
  void _showQuizOverDialog(String message) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(widget.gameOverTitle),
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
                  key: QuizScreen.okButtonKey),
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

/// Extension on `QuizScreenState` to provide responsive layout utilities.
extension QuizScreenSizes on QuizScreenState {
  /// Returns the container padding based on the screen size.
  ///
  /// This method calculates padding for the quiz screen using `getValueForScreenType`,
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