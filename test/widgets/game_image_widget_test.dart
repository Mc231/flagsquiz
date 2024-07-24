import 'package:flagsquiz/foundation/is_web_checker.dart';
import 'package:flagsquiz/models/country.dart';
import 'package:flagsquiz/ui/game/game_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MockIsWebCheckerTrue extends IsWebChecker {
  const MockIsWebCheckerTrue();

  @override
  bool isWeb() {
    return true;
  }
}

void main() {
  testWidgets('GameImageWidget displays CachedNetworkImage on web', (WidgetTester tester) async {
    // Create a mock country object
    final country = Country.fromJson({
      'name': 'Test Country',
      'continent': 'Asia', // Replace with a valid continent name
      'code': 'TC',
    });

    // Build the GameImageWidget with a mock IsWebChecker that simulates web environment
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GameImageWidget(
            key: Key('testWidget'),
            country: country,
            width: 100.0,
            height: 100.0,
            isWebChecker: const MockIsWebCheckerTrue(), // Simulate web environment
          ),
        ),
      ),
    );

    // Verify that the CachedNetworkImage is displayed
    expect(find.byType(CachedNetworkImage), findsOneWidget);
    expect(find.byKey(Key("image_tc")), findsOneWidget);
  });
}