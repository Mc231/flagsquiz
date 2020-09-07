import 'package:flagsquiz/models/question.dart';

abstract class GameState {}

class LoadingState extends GameState {}

class QuestionState extends GameState {
  final Question question;
  final int progress;
  final int total;

  double get percentageProgress => (progress / total).toDouble();

  QuestionState(this.question, this.progress, this.total);
}
