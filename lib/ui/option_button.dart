import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OptionButton extends StatelessWidget {
  final String title;
  final VoidCallback onClickListener;

  const OptionButton(
      {Key key, @required this.title, @required this.onClickListener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClickListener,
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        backgroundColor: Colors.black
      ),
      child: Text(
        title,
        maxLines: maxLines,
        style: TextStyle(fontSize: getFontSize(context)),
        textAlign: TextAlign.center,
      ),
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
