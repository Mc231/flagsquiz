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
              var maxWidth = constraints.maxWidth;
              var maxHeight = constraints.maxHeight;
              var crossAxisCount = maxHeight > maxWidth ? 1 : 2;
              var tabletCondition = MediaQuery.of(context).screenType == ScreenType.tabletScreen;
              final itemHeight = tabletCondition ? 92 : 46;
              final itemWidth = maxWidth - 32;
              return GridView.count(
                  shrinkWrap: true,
                  childAspectRatio: (itemWidth / itemHeight),
                  crossAxisCount: crossAxisCount,
                  children: getItems(context));
            }),
          ),
        ],
      ),
    );
  }
}
