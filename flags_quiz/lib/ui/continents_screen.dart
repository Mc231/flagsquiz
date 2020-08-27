import 'package:flagsquiz/bloc/game_bloc.dart';
import 'package:flagsquiz/foundation/bloc_provider.dart';
import 'package:flagsquiz/localizations.dart';
import 'package:flagsquiz/models/continent.dart';
import 'package:flagsquiz/models/screen_type.dart';
import 'package:flagsquiz/ui/base_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flagsquiz/extensions/continent_additions.dart';
import 'package:flagsquiz/extensions/screen_type_utils.dart';
import 'game_screen.dart';
import 'package:flagsquiz/extensions/boxconstraints_utils.dart';

class ContinentsScreen extends StatelessWidget {

  List<Widget> getItems(BuildContext context) {
    return Continent.values.map((item) {
      return Container(
        margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
        child: BaseButton(
          title: item.localizedName(context),
          onClickListener: () => _handleItemClick(item, context),
        ),
      );
    }).toList();
  }

  void _handleItemClick(Continent continent, BuildContext context) {
    var bloc = GameBloc(continent);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider(
                  bloc: bloc,
                  child: GameScreen(),
                )));
  }

  /// Warning add safe area container
  @override
  Widget build(BuildContext context) {
    final title = AppLocalizations.of(context).selectRegion;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              final itemWidth = constraints.maxWidth;
              final screenType = MediaQuery.of(context).screenType;
              var axisCount = 2;
              var itemHeight = 46;
              switch (constraints.orientation) {
                case Orientation.landscape:
                  switch (screenType) {
                    case ScreenType.wearableScreen:
                      axisCount = 1;
                      itemHeight = 46;
                      break;
                    case ScreenType.smallScreen:
                      axisCount = 2;
                      itemHeight = 92;
                      break;
                    case ScreenType.phoneScreen:
                      axisCount = 1;
                      itemHeight = 56;
                      break;
                    case ScreenType.tabletScreen:
                      axisCount = 1;
                      itemHeight = 92;
                      break;
                    case ScreenType.bigScreen:
                      axisCount = 1;
                      itemHeight = 92;
                      break;
                  }
                  break;
                case Orientation.portrait:
                  switch (screenType) {
                    case ScreenType.wearableScreen:
                      axisCount = 1;
                      itemHeight = 56;
                      break;
                    case ScreenType.smallScreen:
                      axisCount = 1;
                      itemHeight = 56;
                      break;
                    case ScreenType.phoneScreen:
                      axisCount = 1;
                      itemHeight = 56;
                      break;
                    case ScreenType.tabletScreen:
                      axisCount = 1;
                      itemHeight = 92;
                      break;
                    case ScreenType.bigScreen:
                      axisCount = 1;
                      itemHeight = 92;
                      break;
                  }
                  break;
              }
                return GridView.count(
                    shrinkWrap: true,
                    childAspectRatio: (itemWidth / itemHeight),
                    crossAxisCount: axisCount,
                    children: getItems(context));
            }),
          ),
        ],
      ),
    );
  }
}
