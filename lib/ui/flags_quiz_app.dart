import 'package:flagsquiz/app_strings_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FlagsQuizApp extends StatelessWidget {
  final Widget homeWidget;
  final List<NavigatorObserver> navigationObservers;

  const FlagsQuizApp(
      {Key key, this.homeWidget, this.navigationObservers = const []})
      : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppStringsDelegate(),
      ],
      supportedLocales: AppStrings.createSupportedLocale(false),
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        return locale;
      },
      theme: ThemeData(
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
