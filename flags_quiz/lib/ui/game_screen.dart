import 'package:flagsquiz/bloc/game_bloc.dart';
import 'package:flagsquiz/foundation/bloc_provider.dart';
import 'package:flagsquiz/foundation/scrollable_safe_area_container.dart';
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
          child: ScrollableSafeAreaContainer(
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                // TODO: - Make this reusable
                Image.asset(answerImage, width: 256, height: 256,),
                SizedBox(height: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    addOptionButton(options.first),
                    addOptionButton(options[1]),
                    addOptionButton(options[2]),
                    addOptionButton(options.last),
                  ],
                ),
                progressColumn(questionState),
              ],
            );
          },
        ),
      )),
    );
  }

  Widget addOptionButton(Country option) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: BaseButton(
          title: option.name,
          onClickListener: () {
            _bloc.answerQuestion(option);
          }),
    );
  }

  Widget progressColumn(QuestionState state) {
    return Column(
      children: [
        Text('${state.progress} / ${state.total}'),
        SizedBox(height: 8),
        LinearProgressIndicator(value: state.percentageProgress)
      ],
    );
  }
}
