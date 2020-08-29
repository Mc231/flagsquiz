import 'package:flagsquiz/models/grid_config.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GameScreenGridConfig {

  static const _verySmallScreen = 300;

  final GridConfig portrait;
  final GridConfig landscape;

  GameScreenGridConfig(this.portrait, this.landscape);

  factory GameScreenGridConfig.fromContext(
      SizingInformation information) {
    return GameScreenGridConfig(
        GameScreenGridConfig._portrait(information),
        GameScreenGridConfig._landscape(information));
  }

  static GridConfig _portrait(SizingInformation information) {
    final screenType = information.deviceScreenType;
    final itemWidth = information.localWidgetSize.width;
    var axisCount = 1;
    var itemHeight = 56.0;
    switch (screenType) {
      case DeviceScreenType.watch:
      case DeviceScreenType.mobile:
        axisCount = information.localWidgetSize.shortestSide > _verySmallScreen ? 1 : 2;;
        itemHeight = 56;
        break;
      case DeviceScreenType.tablet:
      case DeviceScreenType.desktop:
        itemHeight = 92;
        break;
      default:
        break;
    }
    return GridConfig(axisCount, itemHeight, itemWidth);
  }

  static GridConfig _landscape(SizingInformation information) {
    final screenType = information.deviceScreenType;
    final itemWidth = information.localWidgetSize.width;
    var axisCount = 1;
    var itemHeight = 56.0;
    switch (screenType) {
      case DeviceScreenType.watch:
      case DeviceScreenType.mobile:
        itemHeight = 56;
        break;
      case DeviceScreenType.tablet:
      case DeviceScreenType.desktop:
        itemHeight = 92;
        break;
      default:
        break;
    }
    return GridConfig(axisCount, itemHeight, itemWidth);
  }
}
