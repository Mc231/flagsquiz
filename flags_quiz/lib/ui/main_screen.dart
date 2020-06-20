import 'package:flagsquiz/localizations.dart';
import 'package:flagsquiz/ui/base_button.dart';
import 'package:flagsquiz/ui/continents_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          BaseButton(
              title: AppLocalizations.of(context).start,
              onClickListener: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ContinentsScreen();
                }));
              }),
          SizedBox(height: 12),
          BaseButton(
              title: AppLocalizations.of(context).records,
              onClickListener: () {
                print('Records');
              }),
          SizedBox(height: 12),
          BaseButton(
              title: AppLocalizations.of(context).about,
              onClickListener: () {
                print('About');
              }),
        ],
      ),
    );
  }
}
