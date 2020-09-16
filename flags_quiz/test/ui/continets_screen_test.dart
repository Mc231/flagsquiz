import 'package:flagsquiz/ui/continents/continents_screen.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_app.dart';

void main() {
  testWidgets('Option button has a title', (WidgetTester tester) async {
    // When
    await tester.pumpWidget(
        TestApp(child: ContinentsScreen()));
    // Then
//    final titleFinder = find.text(title);
//    expect(titleFinder, findsOneWidget);
  });
}