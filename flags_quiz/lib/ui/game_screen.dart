import 'dart:math';

import 'package:flagsquiz/bloc/game_bloc.dart';
import 'package:flagsquiz/foundation/bloc_provider.dart';
import 'package:flagsquiz/localizations.dart';
import 'package:flagsquiz/models/country.dart';
import 'package:flagsquiz/models/screen_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flagsquiz/extensions/screen_type_utils.dart';
import 'package:flagsquiz/extensions/continent_additions.dart';
import 'package:flagsquiz/extensions/boxconstraints_utils.dart';

import 'base_button.dart';

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
        padding: EdgeInsets.all(16),
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
            final screenType = MediaQuery.of(context).screenType;
            return LayoutBuilder(builder: (context, constraints) {
              final orientation = constraints.orientation;
              return Column(
                children: [
                  if (orientation == Orientation.portrait || screenType == ScreenType.wearableScreen)
                    ..._imageAndButtons(questionState, context, constraints),
                  if (orientation == Orientation.landscape)
                    Expanded(
                      child: Row(
                        children: _imageAndButtons(
                            questionState, context, constraints),
                      ),
                    ),
                  _progressColumn(context, questionState)
                ],
              );
            });
          },
        )),
      ),
    );
  }
  
  double imageCoof(BuildContext context) {
    return MediaQuery.of(context).screenType == ScreenType.wearableScreen ? 0.21 : 0.62;
  }

  List<Widget> _imageAndButtons(
      QuestionState state, BuildContext context, BoxConstraints constraints) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var size = min(width, height);
    var imageSize = size * imageCoof(context);
    var answerImage = state.question.answer.flagImage;
    var image = Image.asset(answerImage, width: imageSize, height: imageSize);
    return [
      image,
      SizedBox(width: 16),
      Expanded(
          child: _buttonColumn(state.question.options, context, constraints))
    ];
  }

  Widget _buttonColumn(
      List<Country> options, BuildContext context, BoxConstraints constraints) {
    final screenType = MediaQuery.of(context).screenType;
    var axisCount = 2;
    var itemHeight = 46;
    switch (constraints.orientation) {
      case Orientation.landscape:
        switch (screenType) {
          case ScreenType.wearableScreen:
            axisCount = 2;
            itemHeight = 36;
            break;
          case ScreenType.smallScreen:
            axisCount = 1;
            itemHeight = 92;
            break;
          case ScreenType.phoneScreen:
            axisCount = 1;
            itemHeight = 46;
            break;
          case ScreenType.tabletScreen:
            axisCount = 1;
            itemHeight = 92;
            break;
          case ScreenType.bigScreen:
            axisCount = 1;
            itemHeight = 92;
            break;
        }
        break;
      case Orientation.portrait:
        switch (screenType) {
          case ScreenType.wearableScreen:
            axisCount = 2;
            itemHeight = 46;
            break;
          case ScreenType.smallScreen:
            axisCount = 2;
            itemHeight = 92;
            break;
          case ScreenType.phoneScreen:
            axisCount = 1;
            itemHeight = 46;
            break;
          case ScreenType.tabletScreen:
            axisCount = 1;
            itemHeight = 92;
            break;
          case ScreenType.bigScreen:
            axisCount = 1;
            itemHeight = 92;
            break;
        }
        break;
    }
    final itemWidth = constraints.maxWidth;
    return GridView.count(
        shrinkWrap: true,
        childAspectRatio: (itemWidth / itemHeight),
        crossAxisCount: axisCount,
        children: [
          _addOptionButton(options.first),
          _addOptionButton(options[1]),
          _addOptionButton(options[2]),
          _addOptionButton(options.last),
        ]);
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

  bool _isTablet(BuildContext context) {
    return MediaQuery.of(context).screenType == ScreenType.tabletScreen;
  }

  Widget _addOptionButton(Country option) {
    return Container(
      margin: EdgeInsets.only(bottom: 8, right: 8),
      child: BaseButton(
          title: option.name,
          onClickListener: () {
            _bloc.answerQuestion(option);
          }),
    );
  }

  Widget _progressColumn(BuildContext context, QuestionState state) {
    final fontSize = _isTablet(context) ? 24.0 : 12.0;
    return Column(
      children: [
        Text(
          '${state.progress} / ${state.total}',
          style: TextStyle(fontSize: fontSize),
        ),
        SizedBox(height: 8),
        LinearProgressIndicator(value: state.percentageProgress)
      ],
    );
  }
}
