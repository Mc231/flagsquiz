import 'dart:math';

import 'package:flagsquiz/bloc/game_bloc.dart';
import 'package:flagsquiz/foundation/bloc_provider.dart';
import 'package:flagsquiz/localizations.dart';
import 'package:flagsquiz/ui/game/game_answers_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flagsquiz/extensions/continent_additions.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flagsquiz/extensions/sizing_information_utils.dart';

class GameScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GameScreenState();
  }
}

class _GameScreenState extends State<GameScreen> {
  GameBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of(context);
    _bloc.initialLoad();
    _bloc.gameOverCallback = (String result) {
      _showGameOverDialog(result);
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_bloc.continent.localizedName(context)),
      ),
      body: Container(
        // TODO: - Add correct padding
        padding: EdgeInsets.all(8),
        child: SafeArea(
            child: StreamBuilder<GameState>(
          initialData: _bloc.initialState,
          stream: _bloc.stream,
          builder: (context, snapshot) {
            var state = snapshot.data;
            if (state is LoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            var questionState = state as QuestionState;
            return ResponsiveBuilder(builder: (context, information) {
              if (!information.isWatch) {
                return _createWatchLayout(questionState, information);
              }
              return _createBaseLayout(questionState, information);
            });
          },
        )),
      ),
    );
  }

  Column _createWatchLayout(
      QuestionState questionState, SizingInformation information) {
    return Column(
      children: [
        ..._imageAndButtons(questionState, information),
        _progressColumn(information, questionState)
      ],
    );
  }

  Widget _createBaseLayout(
      QuestionState questionState, SizingInformation information) {
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
        _progressColumn(information, questionState)
      ],
    );
  }

  List<Widget> _imageAndButtons(
      QuestionState state, SizingInformation information) {
    var width = information.localWidgetSize.width;
    var height = information.localWidgetSize.height;
    var size = min(width, height);
    var imageSize = size * (information.isWatch ? 0.7 : 0.62);
    var answerImage = state.question.answer.flagImage;
    var image = Image.asset(answerImage, width: imageSize, height: imageSize);
    return [
      image,
      SizedBox(width: 16),
      Expanded(
          child: GameAnswersWidget(
        options: state.question.options,
        sizingInformation: information,
        answerClickListener: _bloc.processAnswer,
      ))
    ];
  }

  void _showGameOverDialog(String message) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context).yourScore),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(MaterialLocalizations.of(context).okButtonLabel),
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

  Widget _progressColumn(SizingInformation information, QuestionState state) {
    return Column(
      children: [
        Text(
          '${state.progress} / ${state.total}',
          style: TextStyle(fontSize: progressFontSize),
        ),
        SizedBox(height: progressMargin),
        LinearProgressIndicator(value: state.percentageProgress)
      ],
    );
  }
}

extension GameScreenSizes on _GameScreenState {

  double get progressFontSize {
    return getValueForScreenType(
        context: context, mobile: 12, tablet: 24, desktop: 24, watch: 8);
  }

  double get progressMargin => 8;
}
