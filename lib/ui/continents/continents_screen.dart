import 'package:flags_quiz/extensions/app_localizations_extension.dart';
import 'package:flags_quiz/l10n/app_localizations.dart';
import 'package:flags_quiz/models/continent.dart';
import 'package:flutter/material.dart';
import 'package:flags_quiz/extensions/continent_additions.dart';
import 'package:quiz_engine/quiz_engine.dart';
import 'package:quiz_engine_core/quiz_engine_core.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../models/country.dart';

/// A stateless widget that displays a screen for selecting a continent.
///
/// The `ContinentsScreen` class provides a user interface for selecting
/// a continent, allowing users to start a quiz or game based on their
/// selected region. It uses responsive design to adapt the layout based
/// on the device's screen size, providing a consistent user experience
/// across different platforms.
///
/// The screen displays a grid of buttons, each representing a continent,
/// which users can click to navigate to a game screen. The grid layout
/// is responsive and adjusts the number of columns and button sizes based
/// on the screen size.
///
class ContinentsScreen extends StatelessWidget {
  /// A key used for identifying the main screen title widget.
  static const mainScreenTitleKey = Key("main_screen_title");

  @override
  Widget build(BuildContext context) {
    final title = AppLocalizations.of(context)?.selectRegion ?? "";
    return Scaffold(
      appBar: AppBar(
        title: Text(title, key: mainScreenTitleKey),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Expanded(
            child: ResponsiveBuilder(builder: (context, information) {
              return GridView.count(
                  shrinkWrap: true,
                  childAspectRatio:
                      getGridChildAspectRatio(context, information),
                  crossAxisCount: getGridAxisCount(context),
                  children: _getContinentOptions(context));
            }),
          ),
        ],
      ),
    );
  }

  /// Generates a list of widgets representing continent options.
  ///
  /// This method maps over the `Continent` enum values to create a list
  /// of `OptionButton` widgets, each corresponding to a continent. The
  /// buttons are styled and laid out based on the device's screen size.
  ///
  /// [context] is the `BuildContext` used to access the theme and localization.
  ///
  /// Returns a list of `Widget` representing the continent options.
  List<Widget> _getContinentOptions(BuildContext context) {
    return Continent.values.map((item) {
      return Container(
        margin: getButtonMargin(context),
        child: OptionButton(
          key: Key("continent_${item.index}"),
          title: item.localizedName(context) ?? "",
          onClickListener: () => _handleItemClick(item, context),
        ),
      );
    }).toList();
  }

  /// Handles the click event for a continent option.
  ///
  /// This method is called when a user clicks on a continent button.
  /// It creates a new `GameBloc` for the selected continent and navigates
  /// to the `GameScreen` using a `BlocProvider`.
  ///
  /// [continent] is the selected `Continent`.
  /// [context] is the `BuildContext` used for navigation.
  void _handleItemClick(Continent continent, BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final quizEntry = QuizWidgetEntry(
        title: continent.localizedName(context) ?? "",
        gameOverText: appLocalizations.yourScore,
        dataProvider: () async =>
            loadCountriesForContinent(appLocalizations, continent));
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => QuizWidget(quizEntry: quizEntry)));
  }

  Future<List<QuestionEntry>> loadCountriesForContinent(
      AppLocalizations appLocalizations, Continent continent) async {
    final provider = QuizDataProvider<Country>.standard(
        'assets/Countries.json',
        (data) => Country.fromJson(
            data, (key) => appLocalizations.resolveKey(key.toLowerCase())));
    final countries = await provider.provide();
    return (continent == Continent.all
            ? countries
            : countries
                .where((country) => country.continent == continent)
                .toList())
        .map((country) => country.toQuestionEntry)
        .toList();
  }
}

/// Extension on `ContinentsScreen` to provide responsive layout utilities.
extension on ContinentsScreen {
  static const _buttonMargin =
      EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16);

  /// Returns the button margin based on the screen size.
  ///
  /// This method calculates the margin for buttons using the
  /// `getValueForScreenType` utility, providing different margins for
  /// mobile, tablet, desktop, and watch screen sizes.
  ///
  /// [context] is the `BuildContext` used to determine the screen size.
  ///
  /// Returns the `EdgeInsets` for button margin.
  EdgeInsets getButtonMargin(BuildContext context) {
    return getValueForScreenType(
        context: context,
        mobile: _buttonMargin,
        tablet: _buttonMargin,
        desktop: _buttonMargin,
        watch: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8));
  }

  /// Returns the number of columns in the grid based on the screen size.
  ///
  /// This method uses the `getValueForScreenType` utility to determine
  /// the number of columns for the grid layout, adapting to different
  /// screen sizes.
  ///
  /// [context] is the `BuildContext` used to determine the screen size.
  ///
  /// Returns the number of columns for the grid.
  int getGridAxisCount(BuildContext context) {
    return getValueForScreenType(
        context: context, mobile: 1, tablet: 1, desktop: 1, watch: 1);
  }

  /// Returns the aspect ratio for grid children based on the screen size.
  ///
  /// This method calculates the child aspect ratio for the grid layout
  /// using the `getValueForScreenType` utility, providing different
  /// values for mobile, tablet, desktop, and watch screen sizes.
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
}
