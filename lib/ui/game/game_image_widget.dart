import 'package:flagsquiz/models/country.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../foundation/is_web_checker.dart';

class GameImageWidget extends StatelessWidget {
  final Country country;
  final double width;
  final double height;
  final IsWebChecker isWebChecker;

  const GameImageWidget(
      {required Key key,
      required this.country,
      required this.width,
      required this.height,
      this.isWebChecker = const IsWebCheckerImpl()})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isWebChecker.isWeb() ? _webWidget() : _normalWidget();
  }

  Widget _webWidget() {
    return CachedNetworkImage(
      key: Key("image_${country.code.toLowerCase()}"),
      imageUrl: country.flagRemoteImage,
      width: width,
      height: height,
      placeholder: (context, url) => CircularProgressIndicator(),
    );
  }

  Widget _normalWidget() {
    return Image.asset(country.flagLocalImage,
        key: Key("image_${country.code.toLowerCase()}"),
        width: width,
        height: height);
  }
}
