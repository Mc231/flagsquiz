
import 'package:flagsquiz/bussiness_logic/game_bloc.dart';
import 'package:flagsquiz/foundation/bloc_provider.dart';
import 'package:flagsquiz/models/continent.dart';
import 'package:flagsquiz/app_strings_delegate.dart';
import 'package:flagsquiz/ui/option_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flagsquiz/extensions/continent_additions.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../game/game_screen.dart';

class ContinentsScreen extends StatelessWidget {
  /// Warning add safe area container
  @override
  Widget build(BuildContext context) {
    final title = AppStrings.of(context).selectRegion;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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

  List<Widget> _getContinentOptions(BuildContext context) {
    return Continent.values.map((item) {
      return Container(
        margin: getButtonMargin(context),
        child: OptionButton(
          title: item.localizedName(context),
          onClickListener: () => _handleItemClick(item, context),
        ),
      );
    }).toList();
  }

  void _handleItemClick(Continent continent, BuildContext context) {
    var bloc = GameBloc.standard(continent);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider(
                  bloc: bloc,
                  child: GameScreen(),
                )));
  }
}

/// Contains continents screen related stuff
extension on ContinentsScreen {
  static const _buttonMargin =
      EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16);

  EdgeInsets getButtonMargin(BuildContext context) {
    return getValueForScreenType(
        context: context,
        mobile: _buttonMargin,
        tablet: _buttonMargin,
        desktop: _buttonMargin,
        watch: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8));
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
