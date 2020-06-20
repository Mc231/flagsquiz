import 'package:flagsquiz/foundation/single_subscription_bloc.dart';
import 'package:flagsquiz/models/Answer.dart';
import 'package:flagsquiz/models/Country.dart';
import 'package:flagsquiz/models/continent.dart';
import 'package:flagsquiz/models/question.dart';

abstract class InitialState {}

class QuestionState {
  final Question question;

  QuestionState(this.question);
}

class GameBloc extends SingleSubscriptionBloc {

  final Continent continent;
  List<Country> countries = [];

  List<Country> left = [];
  var _progress = 0;
  var _question;
  List<Answer> answers = [];

  GameBloc(this.continent);

  @override
  // TODO: implement initialState
  get initialState => throw UnimplementedError();



}