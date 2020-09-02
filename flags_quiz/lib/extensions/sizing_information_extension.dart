import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

extension SizingInformationExtension on SizingInformation {

  Orientation get orientation {
    final size = localWidgetSize;
    return size.width > size.height ? Orientation.landscape : Orientation.portrait;
  }
}
