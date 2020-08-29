import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OptionButton extends StatelessWidget {
  final String title;
  final VoidCallback onClickListener;

  const OptionButton({Key key, this.title, this.onClickListener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenType = getDeviceType(mediaQuery.size);
    // TODO: - Add correct phone
    final fontSize = screenType == DeviceScreenType.tablet ? 24.0 : (screenType == DeviceScreenType.watch ? 8.0 : 16.0);
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
