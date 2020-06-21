import 'package:flagsquiz/bloc/game_bloc.dart';
import 'package:flagsquiz/foundation/bloc_provider.dart';
import 'package:flagsquiz/localizations.dart';
import 'package:flagsquiz/models/continent.dart';
import 'package:flagsquiz/ui/base_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'game_screen.dart';

/// Represents continent item
class ContinentItem {
  final String title;
  final Continent continent;

  ContinentItem(this.title, this.continent);

  factory ContinentItem.fromContinent(
      Continent continent, BuildContext context) {
    var localizations = AppLocalizations.of(context);
    ContinentItem item;
    switch (continent) {
      case Continent.AF:
        item = ContinentItem(localizations.africa, Continent.AF);
        break;
      case Continent.EU:
        item = ContinentItem(localizations.europe, Continent.EU);
        break;
      case Continent.AS:
        item = ContinentItem(localizations.asia, Continent.AS);
        break;
      case Continent.NA:
        item = ContinentItem(localizations.northAmerica, Continent.NA);
        break;
      case Continent.SA:
        item = ContinentItem(localizations.southAmerica, Continent.SA);
        break;
      case Continent.OC:
        item = ContinentItem(localizations.oceania, Continent.OC);
        break;
    }
    return item;
  }

  static List<ContinentItem> allItems(BuildContext context) {
    final title = AppLocalizations.of(context).all;
    final item = ContinentItem(title, null);
    var result = <ContinentItem>[item];
    Continent.values.forEach((continent) {
      result.add(ContinentItem.fromContinent(continent, context));
    });
    return result;
  }
}

class ContinentsScreen extends StatelessWidget {
  List<Widget> getItems(BuildContext context) {
    return ContinentItem.allItems(context).map((item) {
      return Container(
        margin: EdgeInsets.only(bottom: 16),
        child: BaseButton(
          title: item.title,
          onClickListener: () => _handleItemClick(item, context),
        ),
      );
    }).toList();
  }

  void _handleItemClick(ContinentItem item, BuildContext context) {
    var bloc = GameBloc(item.continent);
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
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 16.0),
            child: Text(
              AppLocalizations.of(context).selectRegion,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: OrientationBuilder(builder: (context, orientation) {
              var crossAxisCount = orientation == Orientation.portrait ? 1 : 2;
              var size = MediaQuery.of(context).size;
              final itemHeight =
                  56 + (orientation == Orientation.portrait ? 0 : 64);
              final itemWidth = size.width - 32;
              return GridView.count(
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
