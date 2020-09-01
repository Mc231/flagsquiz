import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

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

extension on OptionButton {
  BorderRadius get borderRadius => BorderRadius.circular(8);

  int get maxLines => 2;

  double getFontSize(BuildContext context) {
    return getValueForScreenType(
        context: context, mobile: 16, tablet: 24, desktop: 24, watch: 12);
  }
}
