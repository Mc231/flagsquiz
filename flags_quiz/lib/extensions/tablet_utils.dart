import 'package:flutter/cupertino.dart';

extension TabletUtils on MediaQueryData {

  static const minTableSize = 600;
  static const verySmallPhoneWidth = 321;

  /// Determinate is current device screen table
  bool isTablet() {
    return size.shortestSide > 600;
  }

  /// Determinate is device with screen width less than 320
  bool isVerySmallPhone() {
    return size.shortestSide < verySmallPhoneWidth;
  }
}