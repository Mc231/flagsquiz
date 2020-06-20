import 'package:flagsquiz/models/Country.dart';

class Question {
  final Country answer;
  final List<Country> options;

  Question(this.answer, this.options);
}