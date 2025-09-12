import 'package:flags_quiz/extensions/app_localizations_extension.dart';
import 'package:flags_quiz/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AppLocalizationsExtension resolveKey returns correct values', (WidgetTester tester) async {

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('en'),
        home: Builder(
          builder: (BuildContext context) {
            final localizations = AppLocalizations.of(context)!;

            for (var entry in AppLocalizationsExtension.keyMap.entries) {
              final key = entry.key;
              final expectedValue = localizations.resolveKey(key);

              expect(
                localizations.resolveKey(key),
                expectedValue,
                reason: 'Failed for key: $key',
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  });
}