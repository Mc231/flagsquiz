import 'package:flagsquiz/models/grid_config.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ContinentsScreenGridConfig {
  final GridConfig portrait;
  final GridConfig landscape;

  ContinentsScreenGridConfig(this.portrait, this.landscape);

  factory ContinentsScreenGridConfig.fromContext(
      SizingInformation information) {
    return ContinentsScreenGridConfig(
        ContinentsScreenGridConfig._portrait(information),
        ContinentsScreenGridConfig._landscape(information));
  }

  static GridConfig _portrait(SizingInformation information) {
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

  static GridConfig _landscape(SizingInformation information) {
    final screenType = information.deviceScreenType;
    final itemWidth = information.localWidgetSize.width;
    var axisCount = 1;
    var itemHeight = 66.0;
    switch (screenType) {
      case DeviceScreenType.watch:
      case DeviceScreenType.mobile:
        itemHeight = 66;
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
