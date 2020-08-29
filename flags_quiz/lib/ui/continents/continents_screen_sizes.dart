import 'package:flagsquiz/models/grid_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'continents_screen.dart';

/// Contains continents screen related stuff
extension ContinentsScreenSizes on ContinentsScreen {

  static const _buttonMargin =
  EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16);

  EdgeInsets getButtonMargin(BuildContext context) {
    return getValueForScreenType(
        context: context,
        mobile: _buttonMargin,
        tablet: _buttonMargin,
        desktop: _buttonMargin,
        watch: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8)
    );
  }

  int getGridAxisCount(BuildContext context) {
    return getValueForScreenType(
        context: context, mobile: 1, tablet: 1, desktop: 1, watch: 1);
  }

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
