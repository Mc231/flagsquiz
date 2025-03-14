import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// A customizable button widget used for displaying options in the app.
///
/// The `OptionButton` class is a stateless widget that represents an option
/// button with a title and a click callback. It is designed to be used
/// in various parts of the application where user interaction is required,
/// such as selecting answers in a quiz or navigating between options.
///
/// The button is styled with a consistent design, including a rounded border,
/// background color, and font size that adapts to different screen sizes
/// using the `responsive_builder` package.
///
class OptionButton extends StatelessWidget {
  /// The title displayed on the button.
  final String title;

  /// The callback function invoked when the button is clicked.
  final VoidCallback onClickListener;

  /// Creates an `OptionButton` with the specified title and click listener.
  ///
  /// [key] is the unique key for this widget.
  /// [title] is the text displayed on the button.
  /// [onClickListener] is the function called when the button is pressed.
  const OptionButton(
      {super.key, required this.title, required this.onClickListener});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClickListener,
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        backgroundColor: Colors.black,
      ),
      child: Text(
        title,
        maxLines: maxLines,
        style: TextStyle(fontSize: getFontSize(context)),
        textAlign: TextAlign.center,
      ),
    );
  }
}

/// Extension on `OptionButton` to provide styling utilities.
extension on OptionButton {
  /// Returns the border radius for the button.
  ///
  /// This property defines the button's corner radius to create a rounded appearance.
  BorderRadius get borderRadius => BorderRadius.circular(8);

  /// The maximum number of lines allowed for the button's title text.
  ///
  /// This property limits the title to two lines, ensuring proper layout.
  int get maxLines => 2;

  /// Returns the font size for the button's title text based on screen size.
  ///
  /// This method uses `getValueForScreenType` to adjust the font size
  /// for different device types, providing a responsive design.
  ///
  /// [context] is the `BuildContext` used to determine the screen size.
  ///
  /// Returns the font size for the button's title text.
  double getFontSize(BuildContext context) {
    return getValueForScreenType(
        context: context, mobile: 16, tablet: 24, desktop: 24, watch: 12);
  }
}