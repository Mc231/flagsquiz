import 'package:flags_quiz/extensions/app_localizations_extension.dart';
import 'package:flags_quiz/models/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flags_quiz/extensions/sizing_information_extension.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../components/option_button.dart';

/// A widget that displays answer options for a game question.
///
/// The `GameAnswersWidget` is a stateless widget that presents a grid
/// of answer options to the user. Each option is represented by a button
/// displaying the name of a country. When a button is clicked, it triggers
/// the provided callback function with the selected answer.
///
/// This widget is designed to be responsive, adapting its layout to
/// different screen sizes and orientations using the `responsive_builder`
/// package. It supports both portrait and landscape orientations and
/// adjusts the grid layout accordingly.
///
class GameAnswersWidget extends StatelessWidget {
  /// The list of country options to display.
  final List<Country> options;

  /// The sizing information for the current screen, used to determine layout.
  final SizingInformation sizingInformation;

  /// Callback function to be invoked when an option is clicked.
  final Function(Country answer) answerClickListener;

  /// Creates a `GameAnswersWidget`.
  ///
  /// [key] is the key for this widget.
  /// [options] is the list of countries to display as answer options.
  /// [sizingInformation] provides screen size and orientation information.
  /// [answerClickListener] is called when an option button is clicked.
  const GameAnswersWidget(
      {required Key key,
        required this.options,
        required this.sizingInformation,
        required this.answerClickListener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        shrinkWrap: true,
        mainAxisSpacing: getAxisSpacing(context),
        crossAxisSpacing: getAxisSpacing(context),
        childAspectRatio: getGridChildAspectRatio(context, sizingInformation),
        crossAxisCount: getGridAxisCount(context, sizingInformation),
        children: options
            .map((option) => _createOptionButton(option, context))
            .toList());
  }

  /// Creates an option button for a given country.
  ///
  /// This method constructs an `OptionButton` widget for a specific country,
  /// using the country's localized name and attaching the click listener
  /// to invoke the `answerClickListener` with the selected country.
  ///
  /// [option] is the country for which the button is created.
  /// [context] is the build context for accessing localization.
  ///
  /// Returns a `Widget` representing the option button.
  Widget _createOptionButton(Country option, BuildContext context) {
    final localizedCountryName = AppLocalizations.of(context)!.resolveKey(option.code.toLowerCase());
    return Container(
      margin: getButtonMargin(context),
      child: OptionButton(
        title: localizedCountryName,
        onClickListener: () => answerClickListener(option),
        key: Key("button_${option.code.toLowerCase()}"),
      ),
    );
  }
}

/// Extension on `GameAnswersWidget` to provide responsive layout utilities.
extension on GameAnswersWidget {
  static const _defaultButtonMargin = EdgeInsets.only(bottom: 8);
  static const _verySmallScreen = 300;

  /// Returns the axis spacing for the grid based on screen size.
  ///
  /// This method calculates the spacing between grid items using
  /// `getValueForScreenType`, providing different spacing for mobile,
  /// tablet, desktop, and watch screen sizes.
  ///
  /// [context] is the `BuildContext` used to determine the screen size.
  ///
  /// Returns the spacing between grid items.
  double getAxisSpacing(BuildContext context) {
    return getValueForScreenType(
        context: context, mobile: 8, tablet: 16, desktop: 16, watch: 0);
  }

  /// Returns the number of columns in the grid based on screen size and orientation.
  ///
  /// This method determines the number of columns for the grid layout,
  /// adapting to different screen sizes and orientations using
  /// `getValueForScreenType`.
  ///
  /// [context] is the `BuildContext` used to determine the screen size.
  /// [information] provides additional sizing information for the widget.
  ///
  /// Returns the number of columns for the grid.
  int getGridAxisCount(BuildContext context, SizingInformation information) {
    final orientation = information.orientation;
    final mobileAxisCount = orientation == Orientation.landscape
        ? 1
        : information.localWidgetSize.shortestSide > _verySmallScreen
        ? 1
        : 2;
    return getValueForScreenType(
        context: context,
        mobile: mobileAxisCount,
        tablet: 1,
        desktop: 1,
        watch: 1);
  }

  /// Returns the aspect ratio for grid children based on screen size.
  ///
  /// This method calculates the child aspect ratio for the grid layout
  /// using `getValueForScreenType`, providing different values for mobile,
  /// tablet, desktop, and watch screen sizes.
  ///
  /// [context] is the `BuildContext` used to determine the screen size.
  /// [information] provides additional sizing information for the widget.
  ///
  /// Returns the aspect ratio for grid children.
  double getGridChildAspectRatio(
      BuildContext context, SizingInformation information) {
    final height = getValueForScreenType(
        context: context,
        mobile: 56.0,
        tablet: 92.0,
        desktop: 92.0,
        watch: 36.0);
    final width = information.localWidgetSize.width;
    return width / height;
  }

  /// Returns the button margin based on the screen size.
  ///
  /// This method calculates the margin for buttons using `getValueForScreenType`,
  /// providing different margins for mobile, tablet, desktop, and watch screen sizes.
  ///
  /// [context] is the `BuildContext` used to determine the screen size.
  ///
  /// Returns the `EdgeInsets` for button margin.
  EdgeInsets getButtonMargin(BuildContext context) {
    return getValueForScreenType(
        context: context,
        mobile: _defaultButtonMargin,
        tablet: _defaultButtonMargin,
        desktop: _defaultButtonMargin,
        watch: EdgeInsets.only(bottom: 4));
  }
}