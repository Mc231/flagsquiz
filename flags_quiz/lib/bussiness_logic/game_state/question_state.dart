import 'package:flagsquiz/models/country.dart';
import 'package:flagsquiz/models/question.dart';
import 'game_state.dart';

class QuestionState extends GameState {
  final Question<Country> question;
  final int progress;
  final int total;

  double get percentageProgress => (progress / total).toDouble();

  QuestionState(this.question, this.progress, this.total);
}