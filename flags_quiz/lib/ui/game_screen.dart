import 'dart:math';

import 'package:flagsquiz/bloc/game_bloc.dart';
import 'package:flagsquiz/foundation/bloc_provider.dart';
import 'package:flagsquiz/localizations.dart';
import 'package:flagsquiz/models/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_button.dart';

class GameScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GameScreenState();
  }
}

class _GameScreenState extends State<GameScreen> {
  static const _imageCoof = 0.68;
  static const _verySmallScreenWidth = 289;

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
            return OrientationBuilder(builder: (context, orientation) {
              return Column(
                children: [
                  if (orientation == Orientation.portrait)
                    ..._imageAndButtons(questionState, context),
                  if (orientation == Orientation.landscape)
                    Row(
                      children: _imageAndButtons(questionState, context),
                    ),
                  _progressColumn(questionState)
                ],
              );
            });
          },
        )),
      ),
    );
  }

  List<Widget> _imageAndButtons(QuestionState state, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var size = min(width, height);
    var imageSize = size * _imageCoof;
    var answerImage = state.question.answer.flagImage;
    var image = Image.asset(answerImage, width: imageSize, height: imageSize);
    return [
      image,
      SizedBox(width: 16, height: 16),
      Expanded(child: _buttonColumn(state.question.options, context))
    ];
  }

  Widget _buttonColumn(List<Country> options, BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var maxWidth = constraints.maxWidth;
      var maxHeight = constraints.maxHeight;
      var caseForVerySmallScreens = maxWidth < _verySmallScreenWidth ? 2 : 1;
      var crossAxisCount = maxHeight > maxWidth ? 1 : caseForVerySmallScreens;
      var shortestSide = MediaQuery.of(context).size.shortestSide;
      // TODO: - Implement this
      final itemHeight =  shortestSide > 600 ? 92 : 46;

      final itemWidth = maxWidth - 32;
      return GridView.count(
          shrinkWrap: true,
          childAspectRatio: (itemWidth / itemHeight),
          crossAxisCount: crossAxisCount,
          children: [
            _addOptionButton(options.first),
            _addOptionButton(options[1]),
            _addOptionButton(options[2]),
            _addOptionButton(options.last),
          ]);
    });
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

  Widget _progressColumn(QuestionState state) {
    return Column(
      children: [
        Text('${state.progress} / ${state.total}'),
        SizedBox(height: 8),
        LinearProgressIndicator(value: state.percentageProgress)
      ],
    );
  }
}
