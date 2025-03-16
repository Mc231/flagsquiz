import 'package:flags_quiz/l10n/app_localizations.dart' show AppLocalizations;
import 'package:flags_quiz/models/continent.dart';
import 'package:flags_quiz/ui/continents/continents_screen.dart';
import 'package:flags_quiz/ui/flags_quiz_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Success Flow Test', () {
    Future<Null> verifySuccessFlow(
        Continent continent, WidgetTester tester) async {
      final selectReginFinder = find.byKey(ContinentsScreen.mainScreenTitleKey);
      expect(selectReginFinder, findsOneWidget);

      final continentButtonFinder =
      find.byKey(Key('continent_${continent.index}'));
      print(continentButtonFinder);
      await tester.ensureVisible(continentButtonFinder);
      expect(continentButtonFinder, findsOneWidget);
      await tester.tap(continentButtonFinder);
      await tester
          .pumpAndSettle(); // Ensures all animations and frames are processed

      // Get the total number of iterations from the text "0 / 14"
      final scoreFinder = find.byWidgetPredicate((widget) =>
      widget is Text &&
          widget.data != null &&
          widget.data!.contains(RegExp(r'^\d+ / \d+$')));

      // Verify that the score text is found
      expect(scoreFinder, findsOneWidget);

      final scoreText = (scoreFinder.evaluate().first.widget as Text).data!;
      final totalIterations = int.parse(scoreText.split(' / ')[1]);

      for (int i = 0; i < totalIterations; i++) {
        // Find all the image widgets by their key prefix.
        final imageFinder = find.byWidgetPredicate((widget) =>
        widget is Image &&
            widget.key != null &&
            widget.key.toString().startsWith('[<\'image_'));

        if (imageFinder.evaluate().isEmpty) {
          fail('No image found');
        }

        final imageFinderEvaluated = imageFinder.evaluate().first;

        // Extract the country code from the image key using a regex
        final imageKey = imageFinderEvaluated.widget.key as Key;
        final keyString = imageKey.toString();
        final regex = RegExp(r'image_(.+?)]');
        final match = regex.firstMatch(keyString);

        if (match == null) {
          fail('Failed to extract country code from key: $keyString');
        }

        final countryCode = match.group(1)!;
        print('Country code: $countryCode');

        // Find the corresponding button by constructing its key
        final buttonKey = Key('button_$countryCode');
        final buttonFinder = find.byWidgetPredicate((widget) =>
        widget.key != null &&
            widget.key.toString().startsWith('[<\'button_$countryCode'));

        // Verify that the button is found
        if (buttonFinder.evaluate().isEmpty) {
          print('Button with key $buttonKey not found');
          fail('Button with key $buttonKey not found');
        } else {
          print('Button with key $buttonKey found');
        }

        expect(buttonFinder, findsOneWidget);

        // Tap the button
        await tester.tap(buttonFinder);

        // Trigger a frame
        await tester.pumpAndSettle();
      }

      final dialog = find.byType(Dialog);
      expect(dialog, findsOneWidget);
      final okFinder = find.byKey(Key("ok_button"));
      expect(okFinder, findsOneWidget);
      expect(find.text('$totalIterations / $totalIterations'), findsAny);
      await tester.tap(okFinder);
      await tester.pumpAndSettle();
      expect(selectReginFinder, findsOneWidget);
    }

    testWidgets('Test all modes in all localizations', (WidgetTester tester) async {
      for (Locale locale in AppLocalizations.supportedLocales) {
        final widget = FlagsQuizApp(homeWidget: ContinentsScreen(), locale: locale);
        await tester.pumpWidget(widget);
        for (var continent in Continent.values) {
          await verifySuccessFlow(continent, tester);
        }
      }
    });
  });
}
