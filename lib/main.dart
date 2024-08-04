import 'package:flags_quiz/ui/continents/continents_screen.dart';
import 'package:flags_quiz/ui/flags_quiz_app.dart';
import 'package:flutter/material.dart';

/// The entry point of the Flags Quiz application.
///
/// The `main` function initializes the Flutter application and sets up
/// the root widget for the app. It uses the `FlagsQuizApp` class to
/// configure the application, specifying the home screen widget as
/// `ContinentsScreen`.
///
/// This setup launches the application with the initial screen that allows
/// users to select a continent and start a quiz game. The `FlagsQuizApp`
/// provides localization, theme, and navigation settings for the entire app.
///
/// To start the application, this function calls `runApp`, passing an
/// instance of `FlagsQuizApp`.
///
void main() => runApp(FlagsQuizApp(homeWidget: ContinentsScreen()));


