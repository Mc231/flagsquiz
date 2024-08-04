import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FlagsQuizApp extends StatelessWidget {
  final Widget homeWidget;
  final Locale? locale;
  final List<NavigatorObserver> navigationObservers;

  const FlagsQuizApp(
      {Key? key, required this.homeWidget, this.locale, this.navigationObservers = const []})
      : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(useMaterial3: false),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      localeResolutionCallback:
          (Locale? locale, Iterable<Locale> supportedLocales) {
        return supportedLocales.contains(locale) ? locale : Locale('en');
      },
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorObservers: navigationObservers,
      home: homeWidget,
    );
  }
}
