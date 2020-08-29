import 'package:flagsquiz/models/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flagsquiz/extensions/sizing_information_utils.dart';
import '../option_button.dart';
import 'game_screen_grid_config.dart';

class GameAnswersWidget extends StatelessWidget {
  final List<Country> options;
  final SizingInformation sizingInformation;
  final Function(Country answer) answerClickListener;

  const GameAnswersWidget(
      {Key key, this.options, this.sizingInformation, this.answerClickListener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = sizingInformation.orientation;
    final configuration = GameScreenGridConfig.fromContext(sizingInformation);
    final gridConfig = orientation == Orientation.portrait
        ? configuration.portrait
        : configuration.landscape;
    return GridView.count(
        shrinkWrap: true,
        childAspectRatio: gridConfig.aspectRatio,
        crossAxisCount: gridConfig.axisCount,
        children: [
          _addOptionButton(options.first, context),
          _addOptionButton(options[1], context),
          _addOptionButton(options[2], context),
          _addOptionButton(options.last, context),
        ]);
  }

  Widget _addOptionButton(Country option, BuildContext context) {
    return Container(
      margin: getButtonMargin(context),
      child: OptionButton(
          title: option.name,
          onClickListener: () => answerClickListener(option)),
    );
  }
}

extension GameAnswersWidgetSizes on GameAnswersWidget {
  static const _defaultButtonMargin = EdgeInsets.only(bottom: 8);

  EdgeInsets getButtonMargin(BuildContext context) {
    return getValueForScreenType(
        context: context,
        mobile: _defaultButtonMargin,
        tablet: _defaultButtonMargin,
        desktop: _defaultButtonMargin,
        watch: EdgeInsets.only(bottom: 4));
  }
}
