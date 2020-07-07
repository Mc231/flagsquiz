
import 'package:flagsquiz/bloc/game_bloc.dart';
import 'package:flagsquiz/foundation/bloc_provider.dart';
import 'package:flagsquiz/localizations.dart';
import 'package:flagsquiz/models/continent_item.dart';
import 'package:flagsquiz/ui/base_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'game_screen.dart';

class ContinentsScreen extends StatelessWidget {
  List<Widget> getItems(BuildContext context) {
    return ContinentItem.allItems(context).map((item) {
      return Container(
        margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
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
          SizedBox(height: 56),
          Text(
            AppLocalizations.of(context).selectRegion,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              var maxWidth = constraints.maxWidth;
              var maxHeight = constraints.maxHeight;
              var crossAxisCount = maxHeight > maxWidth ? 1 : 2;

              final itemHeight =
                  56 + (maxHeight > maxWidth ? 0 : 64);

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
