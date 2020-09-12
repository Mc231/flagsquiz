import 'package:flagsquiz/models/country.dart';
import 'package:flagsquiz/models/question.dart';

class Answer {
  final Country selectedOption;
  final Question question;

  Answer(this.selectedOption, this.question);

  bool get isCorrect => question?.answer == selectedOption;
}
