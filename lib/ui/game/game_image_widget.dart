
import 'package:flagsquiz/models/country.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GameImageWidget extends StatelessWidget {
  final Country country;
  final double width;
  final double height;

  const GameImageWidget(
      {Key key,
        @required this.country,
        @required this.width,
        @required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return kIsWeb ? _webWidget() : _normalWidget();
  }

  Widget _webWidget() {
    return CachedNetworkImage(
      imageUrl: country.flagRemoteImage,
      width: width,
      height: height,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  Widget _normalWidget() {
    return Image.asset(country.flagLocalImage, width: width, height: height);
  }
}