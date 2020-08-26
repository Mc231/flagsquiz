import 'package:flagsquiz/models/screen_type.dart';
import 'package:flutter/cupertino.dart';

extension ScreenTypeUtils on MediaQueryData {

  static const wearableSize = 200;
  static const smallScreenSize = 321;
  static const tabletSize = 600;
  // TODO: - Investigate this
  static const bigScreenSize = 1025;


  ScreenType get screenType {
    final shortestSide = size.shortestSide;
    if(shortestSide < wearableSize) {
      return ScreenType.wearableScreen;
    }else if(shortestSide <  smallScreenSize) {
      return ScreenType.smallScreen;
    }else if(shortestSide > tabletSize && shortestSide < bigScreenSize){
      return ScreenType.tabletScreen;
    }else{
      return ScreenType.bigScreen;
    }
  }
}