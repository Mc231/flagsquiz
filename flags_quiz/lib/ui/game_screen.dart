import 'package:flagsquiz/bloc/game_bloc.dart';
import 'package:flagsquiz/foundation/bloc_provider.dart';
import 'package:flagsquiz/foundation/scrollable_safe_area_container.dart';
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
                var answerImage = questionState.question.answer.flagImage;
                var options = questionState.question.options;
                return OrientationBuilder(builder: (context, orientation) {
                  print(orientation);
                  if (orientation == Orientation.portrait) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // TODO: - Make this reusable
                        Image.asset(
                          answerImage,
                          width: 256,
                          height: 256,
                        ),
                        SizedBox(height: 16),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _addOptionButton(options.first),
                            _addOptionButton(options[1]),
                            _addOptionButton(options[2]),
                            _addOptionButton(options.last),
                          ],
                        ),
                        _progressColumn(questionState),
                      ],
                    );
                  } else {
                    // TODO: - Add correct calculation
                    var size = MediaQuery.of(context).size;
                    var width = size.width * 0.8;
                    var height = size.height * 0.5633;

                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(
                              answerImage,
                              width: height,
                              height: width,
                            ),
                            SizedBox(height: 16),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _addOptionButton(options.first),
                                  _addOptionButton(options[1]),
                                  _addOptionButton(options[2]),
                                  _addOptionButton(options.last),
                                ],
                              ),
                            ),

                          ],
                        ),
                        _progressColumn(questionState),
                      ],
                    );
                  }
                });
              },
            )),
      ),
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

  Widget _addOptionButton(Country option) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
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
