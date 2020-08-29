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
import 'continents_screen_sizes.dart';

class ContinentsScreen extends StatelessWidget {
  List<Widget> getContinentOptions(BuildContext context) {
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
              return GridView.count(
                  shrinkWrap: true,
                  childAspectRatio:
                      getGridChildAspectRatio(context, information),
                  crossAxisCount: getGridAxisCount(context),
                  children: getContinentOptions(context));
            }),
          ),
        ],
      ),
    );
  }
}
