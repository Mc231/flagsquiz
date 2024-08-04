import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// An extension on `SizingInformation` to provide additional utilities.
///
/// The `SizingInformationExtension` adds a convenient method to the
/// `SizingInformation` class to determine the orientation of the widget
/// based on its local size. This is particularly useful for responsive
/// design, where the layout may change depending on the device's orientation.
///
/// The extension adds an `orientation` property that calculates the
/// orientation based on the width and height of the `localWidgetSize`.
///
extension SizingInformationExtension on SizingInformation {
  /// Determines the orientation of the widget based on its local size.
  ///
  /// This property calculates the orientation by comparing the width
  /// and height of the `localWidgetSize`. If the width is greater than
  /// the height, the orientation is considered landscape; otherwise, it
  /// is considered portrait.
  ///
  /// Returns `Orientation.landscape` if the width is greater than the height,
  /// or `Orientation.portrait` otherwise.
  Orientation get orientation {
    final size = localWidgetSize;
    return size.width > size.height ? Orientation.landscape : Orientation.portrait;
  }
}