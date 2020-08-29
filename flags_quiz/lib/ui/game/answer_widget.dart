import 'package:flagsquiz/models/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flagsquiz/extensions/sizing_information_utils.dart';
import '../option_button.dart';
import 'game_screen_grid_config.dart';

/// Contains 4 answer options
class AnswersWidget extends StatelessWidget {
  final List<Country> options;
  final SizingInformation sizingInformation;
  final Function(Country answer) answerClickListener;

  const AnswersWidget(
      {Key key,
      this.options,
      this.sizingInformation,
      this.answerClickListener})
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
          _addOptionButton(options.first),
          _addOptionButton(options[1]),
          _addOptionButton(options[2]),
          _addOptionButton(options.last),
        ]);
  }

  Widget _addOptionButton(Country option) {
    return Container(
      // TODO: - Add correct padding
      margin: EdgeInsets.only(bottom: 4),
      child: OptionButton(
          title: option.name,
          onClickListener: () => answerClickListener(option)),
    );
  }
}
