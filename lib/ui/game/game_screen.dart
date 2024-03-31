import 'dart:math';

import 'package:flagsquiz/bussiness_logic/game_bloc.dart';
import 'package:flagsquiz/bussiness_logic/game_state/game_state.dart';
import 'package:flagsquiz/bussiness_logic/game_state/loading_state.dart';
import 'package:flagsquiz/bussiness_logic/game_state/question_state.dart';
import 'package:flagsquiz/foundation/bloc_provider.dart';
import 'package:flagsquiz/app_strings_delegate.dart';
import 'package:flagsquiz/ui/game/game_answers_widget.dart';
import 'package:flagsquiz/ui/game/game_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flagsquiz/extensions/continent_additions.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flagsquiz/extensions/sizing_information_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GameScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GameScreenState();
  }
}

class GameScreenState extends State<GameScreen> {
  late GameBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of(context);
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
        title: Text(_bloc.continent.localizedName(context) ?? ""),
      ),
      body: Container(
        padding: getContainerPadding(context),
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
            final questionState = state as QuestionState;
            return ResponsiveBuilder(builder: (context, information) {
              return _buildLayout(questionState, information);
            });
          },
        )),
      ),
    );
  }

  Widget _buildLayout(
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
    if (state.question != null) {
      var country = state.question.answer;
      final imageSize = getImageSize(information);
      return [
        GameImageWidget(country: country, width: imageSize, height: imageSize, key: Key(country.code),),
        SizedBox(width: 16),
        Expanded(
            child: GameAnswersWidget(
              options: state.question.options,
              sizingInformation: information,
              answerClickListener: _bloc.processAnswer,
              key: Key(state.total.toString()),
            ))
      ];
    }
    return [];
  }

  void _showGameOverDialog(String message) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppStrings.of(context)?.yourScore ?? ""),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
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

extension GameScreenSizes on GameScreenState {
  static const _imageWatchCof = 0.7;
  static const _imageNormalCof = 0.62;

  EdgeInsets getContainerPadding(BuildContext context) {
    var padding = getValueForScreenType<double>(
        context: context, mobile: 16, tablet: 16, desktop: 16, watch: 8);
    return EdgeInsets.all(padding);
  }

  double getImageSize(SizingInformation information) {
    final width = information.localWidgetSize.width;
    final height = information.localWidgetSize.height;
    final minSize = min(width, height);
    final cof = information.isWatch ? _imageWatchCof : _imageNormalCof;
    return minSize * cof;
  }

  double get progressFontSize {
    return getValueForScreenType(
        context: context, mobile: 12, tablet: 24, desktop: 24, watch: 8);
  }

  double get progressMargin => 8;
}
