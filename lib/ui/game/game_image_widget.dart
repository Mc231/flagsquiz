import 'package:flagsquiz/models/country.dart';
import 'package:flutter/material.dart';

class GameImageWidget extends StatelessWidget {
  final Country country;
  final double width;
  final double height;

  const GameImageWidget(
      {required Key key,
      required this.country,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(country.flagLocalImage,
        key: Key("image_${country.code.toLowerCase()}"),
        width: width,
        height: height);
  }
}
