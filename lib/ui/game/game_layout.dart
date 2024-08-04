import 'dart:math';

import 'package:flags_quiz/extensions/sizing_information_extension.dart';
import 'package:flags_quiz/models/country.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../business_logic/game_state/question_state.dart';
import 'game_answers_widget.dart';
import 'game_image_widget.dart';

/// A widget that displays the layout for a game screen, including the question image and answer options.
///
/// The `GameLayout` class is a stateless widget that presents the UI components for a game question,
/// including an image of the country flag and a set of answer options. The layout adapts to the screen
/// orientation (portrait or landscape) using responsive design principles, and it also displays a progress
/// indicator at the bottom of the screen.
///
/// The widget uses the `QuestionState` to manage the current question and progress, and the `processAnswer`
/// callback to handle answer selection.
///
/// Properties:
/// - `questionState`: The current state of the question, including the question details and progress.
/// - `information`: The sizing information for the current screen, used to adjust the layout.
/// - `processAnswer`: The callback function to process an answer when an option is selected.
class GameLayout extends StatelessWidget {
  /// The current state of the question, including the question details and progress.
  final QuestionState questionState;

  /// The sizing information for the current screen, used to adjust the layout.
  final SizingInformation information;

  /// The callback function to process an answer when an option is selected.
  final Function(Country) processAnswer;

  /// Creates a `GameLayout` with the specified question state, sizing information, and answer processor.
  ///
  /// [key] is the unique key for this widget.
  /// [questionState] provides the current question and progress state.
  /// [information] supplies screen size and orientation information.
  /// [processAnswer] is called to process the selected answer.
  const GameLayout(
      {Key? key,
        required this.questionState,
        required this.information,
        required this.processAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = information.orientation;
    return Column(
      children: [
        if (orientation == Orientation.portrait)
          ..._imageAndButtons(questionState, information),
        if (orientation == Orientation.landscape)
          Expanded(
            child: Row(
              children: _imageAndButtons(questionState, information),
            ),
          ),
        _progressColumn(context, information, questionState)
      ],
    );
  }

  /// Generates a list of widgets for the image and answer buttons based on the screen orientation.
  ///
  /// This method creates the layout for the question image and answer buttons, adjusting their
  /// arrangement based on the orientation of the screen.
  ///
  /// [state] is the current question state.
  /// [information] provides sizing details for the screen.
  ///
  /// Returns a list of `Widget` representing the image and answer buttons.
  List<Widget> _imageAndButtons(
      QuestionState state, SizingInformation information) {
    var country = state.question.answer;
    final imageSize = getImageSize(information);
    return [
      GameImageWidget(
        country: country,
        width: imageSize,
        height: imageSize,
        key: Key(country.code),
      ),
      SizedBox(width: 16),
      Expanded(
          child: GameAnswersWidget(
            options: state.question.options,
            sizingInformation: information,
            answerClickListener: processAnswer,
            key: Key(state.total.toString()),
          ))
    ];
  }

  /// Builds the progress display including the progress text and linear progress indicator.
  ///
  /// This method creates the layout for displaying the current progress of the game, showing
  /// the number of questions completed and a progress bar.
  ///
  /// [context] is the `BuildContext` for accessing theme and localization.
  /// [information] provides sizing details for the screen.
  /// [state] is the current question state.
  ///
  /// Returns a `Widget` representing the progress display.
  Widget _progressColumn(BuildContext context, SizingInformation information,
      QuestionState state) {
    return Column(
      children: [
        Text(
          '${state.progress} / ${state.total}',
          style: TextStyle(fontSize: progressFontSize(context)),
        ),
        SizedBox(height: progressMargin),
        LinearProgressIndicator(value: state.percentageProgress)
      ],
    );
  }
}

/// Extension on `GameLayout` to provide responsive layout utilities.
extension GameLayoutSized on GameLayout {
  static const _imageWatchCof = 0.7;
  static const _imageNormalCof = 0.62;

  /// Returns the size for the question image based on the screen size.
  ///
  /// This method calculates the image size using a coefficient based on whether the
  /// device is a watch or not, adjusting the size to fit the screen dimensions.
  ///
  /// [information] provides sizing details for the screen.
  ///
  /// Returns the size for the image as a `double`.
  double getImageSize(SizingInformation information) {
    final width = information.localWidgetSize.width;
    final height = information.localWidgetSize.height;
    final minSize = min(width, height);
    final cof = information.isWatch ? _imageWatchCof : _imageNormalCof;
    return minSize * cof;
  }

  /// Returns the font size for the progress text based on the screen size.
  ///
  /// This method uses `getValueForScreenType` to adjust the font size for different
  /// device types, ensuring readability on all screens.
  ///
  /// [context] is the `BuildContext` used to determine the screen size.
  ///
  /// Returns the font size for the progress text.
  double progressFontSize(BuildContext context) {
    return getValueForScreenType(
        context: context, mobile: 12, tablet: 24, desktop: 24, watch: 8);
  }

  /// The margin used between the progress text and the progress indicator.
  double get progressMargin => 8;
}