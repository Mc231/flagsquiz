import 'package:flutter/material.dart';
import 'package:flagsquiz/extensions/tablet_utils.dart';

class BaseButton extends StatelessWidget {
  final String title;
  final VoidCallback onClickListener;

  const BaseButton({Key key, this.title, this.onClickListener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabletCondtion = MediaQuery.of(context).isTablet();
    final fontSize = tabletCondtion ? 24.0 : 16.0;
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
