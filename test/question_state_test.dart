import 'package:flags_quiz/business_logic/game_state/question_state.dart';
import 'package:flags_quiz/models/country.dart';
import 'package:flags_quiz/models/question.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('init question state', () {
    // Given
    final country =
        Country.fromJson({'name': 'Andorra', 'continent': 'EU', 'code': 'AD'});
    final expectedQuestion = Question<Country>(country, [country]);
    final expectedProgress = 0;
    final expectedTotal = expectedQuestion.options.length;
    // When
    final state =
        QuestionState(expectedQuestion, expectedProgress, expectedTotal);
    expect(state.question, equals(expectedQuestion));
    expect(state.progress, equals(expectedProgress));
    expect(state.total, equals(expectedTotal));
    expect(state.percentageProgress,
        equals((state.progress / state.total).toDouble()));
  });
}
