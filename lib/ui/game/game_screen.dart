import 'package:flagsquiz/bussiness_logic/game_bloc.dart';
import 'package:flagsquiz/bussiness_logic/game_state/game_state.dart';
import 'package:flagsquiz/bussiness_logic/game_state/loading_state.dart';
import 'package:flagsquiz/bussiness_logic/game_state/question_state.dart';
import 'package:flagsquiz/foundation/bloc_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flagsquiz/extensions/continent_additions.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'game_layout.dart';

class GameScreen extends StatefulWidget {
  static const okButtonKey = Key("ok_button");

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
              return GameLayout(
                  questionState: questionState,
                  information: information,
                  processAnswer: _bloc.processAnswer);
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
          title: Text(AppLocalizations.of(context)?.yourScore ?? ""),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(MaterialLocalizations.of(context).okButtonLabel,
                  key: GameScreen.okButtonKey),
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
}

extension GameScreenSizes on GameScreenState {
  EdgeInsets getContainerPadding(BuildContext context) {
    var padding = getValueForScreenType<double>(
        context: context, mobile: 16, tablet: 16, desktop: 16, watch: 8);
    return EdgeInsets.all(padding);
  }
}
