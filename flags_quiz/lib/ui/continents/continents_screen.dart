import 'package:flagsquiz/bloc/game_bloc.dart';
import 'package:flagsquiz/foundation/bloc_provider.dart';
import 'package:flagsquiz/localizations.dart';
import 'package:flagsquiz/models/continent.dart';
import 'package:flagsquiz/ui/option_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flagsquiz/extensions/continent_additions.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../game/game_screen.dart';
import 'continents_screen_grid_config.dart';

class ContinentsScreen extends StatelessWidget {
  List<Widget> getItems(BuildContext context) {
    return Continent.values.map((item) {
      return Container(
        margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
        child: OptionButton(
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
            child: ResponsiveBuilder(builder: (context, information) {
              final orientation = MediaQuery.of(context).orientation;
              final configuration =
                  ContinentsScreenGridConfig.fromContext(information);
              final gridConfig = orientation == Orientation.portrait
                  ? configuration.portrait
                  : configuration.landscape;
              return GridView.count(
                  shrinkWrap: true,
                  childAspectRatio: gridConfig.aspectRatio,
                  crossAxisCount: gridConfig.axisCount,
                  children: getItems(context));
            }),
          ),
        ],
      ),
    );
  }
}
