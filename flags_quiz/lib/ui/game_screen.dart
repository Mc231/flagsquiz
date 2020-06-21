import 'package:flagsquiz/bloc/game_bloc.dart';
import 'package:flagsquiz/foundation/bloc_provider.dart';
import 'package:flagsquiz/models/country.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
          var answerImage =  questionState.question.answer.flagImage;
          var options = questionState.question.options;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(answerImage),
              SizedBox(height: 16),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  addOptionButton(options.first),
                  addOptionButton(options[1]),
                  addOptionButton(options[2]),
                  addOptionButton(options.last),
                ],
              ),
              SizedBox(height: 16),
              Text('${questionState.progress} / ${questionState.total}'),
              LinearProgressIndicator(value: (questionState.progress / questionState.total).toDouble() ?? 0,)
            ],
          );
        },
      )),
    );
  }

  Widget addOptionButton(Country option) {
    return BaseButton(title: option.name, onClickListener: () {
      _bloc.answerQuestion(option);
    });
  }
}
