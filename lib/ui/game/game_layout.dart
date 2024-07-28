import 'dart:math';

import 'package:flagsquiz/extensions/sizing_information_extension.dart';
import 'package:flagsquiz/models/country.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../bussiness_logic/game_state/question_state.dart';
import 'game_answers_widget.dart';
import 'game_image_widget.dart';

class GameLayout extends StatelessWidget {
  final QuestionState questionState;
  final SizingInformation information;
  final Function(Country) processAnswer;

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

extension GameLayoutSized on GameLayout {
  static const _imageWatchCof = 0.7;
  static const _imageNormalCof = 0.62;

  double getImageSize(SizingInformation information) {
    final width = information.localWidgetSize.width;
    final height = information.localWidgetSize.height;
    final minSize = min(width, height);
    final cof = information.isWatch ? _imageWatchCof : _imageNormalCof;
    return minSize * cof;
  }

  double progressFontSize(BuildContext context) {
    return getValueForScreenType(
        context: context, mobile: 12, tablet: 24, desktop: 24, watch: 8);
  }

  double get progressMargin => 8;
}
