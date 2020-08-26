import 'package:flagsquiz/models/screen_type.dart';
import 'package:flutter/material.dart';
import 'package:flagsquiz/extensions/screen_type_utils.dart';

class BaseButton extends StatelessWidget {
  final String title;
  final VoidCallback onClickListener;

  const BaseButton({Key key, this.title, this.onClickListener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabletCondition = MediaQuery.of(context).screenType == ScreenType.tabletScreen;
    final fontSize = tabletCondition ? 24.0 : 16.0;
    return RaisedButton(
      child: Text(
        title,
        maxLines: 2,
        style: TextStyle(fontSize: fontSize),
        textAlign: TextAlign.center,
      ),
      textColor: Colors.white,
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: onClickListener,
    );
  }
}
