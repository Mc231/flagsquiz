import 'package:flutter/cupertino.dart';

extension BoxConstraintsUtils on BoxConstraints {

  Orientation get orientation {
    return maxWidth > maxHeight ? Orientation.landscape : Orientation.portrait;
  }
}
