import 'package:flagsquiz/models/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flagsquiz/extensions/sizing_information_extension.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../option_button.dart';

class GameAnswersWidget extends StatelessWidget {
  final List<Country> options;
  final SizingInformation sizingInformation;
  final Function(Country answer) answerClickListener;

  const GameAnswersWidget(
      {Key key,
      @required this.options,
      @required this.sizingInformation,
      @required this.answerClickListener})
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

  Widget _createOptionButton(Country option, BuildContext context) {
    final localizedCountryName = Intl.message(option.name, name: option.code);
    return Container(
      margin: getButtonMargin(context),
      child: OptionButton(
          title: localizedCountryName,
          onClickListener: () => answerClickListener(option)),
    );
  }
}

extension on GameAnswersWidget {
  static const _defaultButtonMargin = EdgeInsets.only(bottom: 8);
  static const _verySmallScreen = 300;

  double getAxisSpacing(BuildContext context) {
    return getValueForScreenType(
        context: context, mobile: 8, tablet: 16, desktop: 16, watch: 0);
  }

  int getGridAxisCount(BuildContext context, SizingInformation information) {
    final orientation = information.orientation;
    final mobileAxisCount = orientation == Orientation.landscape
        ? 1
        : information.localWidgetSize.shortestSide > _verySmallScreen ? 1 : 2;
    return getValueForScreenType(
        context: context,
        mobile: mobileAxisCount,
        tablet: 1,
        desktop: 1,
        watch: 1);
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

  EdgeInsets getButtonMargin(BuildContext context) {
    return getValueForScreenType(
        context: context,
        mobile: _defaultButtonMargin,
        tablet: _defaultButtonMargin,
        desktop: _defaultButtonMargin,
        watch: EdgeInsets.only(bottom: 4));
  }
}
