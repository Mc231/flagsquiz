import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final String title;
  final VoidCallback onClickListener;

  const BaseButton({Key key, this.title, this.onClickListener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      child: FractionallySizedBox(
        widthFactor: 0.83,
        child: RaisedButton(
          child: Text(
            title,
            style: TextStyle(fontSize: 24.0),
            textAlign: TextAlign.center,
          ),
          textColor: Colors.white,
          color: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onPressed: onClickListener,
        ),
      ),
    );
  }
}
