import 'package:flutter/material.dart';
import 'option_button_sizes.dart';

class OptionButton extends StatelessWidget {
  final String title;
  final VoidCallback onClickListener;

  const OptionButton({Key key, this.title, this.onClickListener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        title,
        maxLines: maxLines,
        style: TextStyle(fontSize: getFontSize(context)),
        textAlign: TextAlign.center,
      ),
      textColor: Colors.white,
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      onPressed: onClickListener,
    );
  }
}
