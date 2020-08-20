import 'dart:math';

import 'package:flagsquiz/bloc/game_bloc.dart';
import 'package:flagsquiz/foundation/bloc_provider.dart';
import 'package:flagsquiz/localizations.dart';
import 'package:flagsquiz/models/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flagsquiz/extensions/tablet_utils.dart';
import 'package:flagsquiz/extensions/continent_additions.dart';

import 'base_button.dart';

class GameScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GameScreenState();
  }
}

class _GameScreenState extends State<GameScreen> {
  static const _imageCoof = 0.62;

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
            return OrientationBuilder(builder: (context, orientation) {
              return Column(
                children: [
                  if (orientation == Orientation.portrait)
                    ..._imageAndButtons(questionState, context, orientation),
                  if (orientation == Orientation.landscape)
                    Expanded(
                      child: Row(
                        children: _imageAndButtons(questionState, context, orientation),
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

  List<Widget> _imageAndButtons(QuestionState state, BuildContext context,
      Orientation orientation) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var size = min(width, height);
    var imageSize = size * _imageCoof;
    var answerImage = state.question.answer.flagImage;
    var image = Image.asset(answerImage, width: imageSize, height: imageSize);
    return [
      image,
      SizedBox(width: 16, height: 16),
      Expanded(child: _buttonColumn(state.question.options, context, orientation))
    ];
  }

  Widget _buttonColumn(List<Country> options,
      BuildContext context,
      Orientation orientation) {
    final mediaQueryData = MediaQuery.of(context);
    final verySmallPhone = mediaQueryData.isVerySmallPhone();
    final isTablet = _isTablet(context);
    var axisCount = 2;
    var itemHeight = 46;
    switch (orientation) {
      case Orientation.landscape:
        axisCount = verySmallPhone ? 1 : isTablet ? 1 : 2;
        itemHeight = isTablet ? 92 : 46;
        break;
      case Orientation.portrait:
        axisCount = verySmallPhone ? 2 : 1;
        itemHeight = isTablet ? 92 : 56;
        break;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
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
    );
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
    return MediaQuery.of(context).isTablet();
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
