import 'package:flagsquiz/models/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flagsquiz/extensions/sizing_information_utils.dart';
import '../base_button.dart';
import 'game_screen_grid_config.dart';

/// Widget with flag and answer options
class GameWidget extends StatelessWidget {
  final List<Country> options;
  final SizingInformation sizingInformation;
  final Function(Country answer) questionClickListener;

  const GameWidget(
      {Key key,
      this.options,
      this.sizingInformation,
      this.questionClickListener})
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
      margin: EdgeInsets.only(bottom: 8, right: 8),
      child: BaseButton(
          title: option.name,
          onClickListener: () => questionClickListener(option)),
    );
  }
}
