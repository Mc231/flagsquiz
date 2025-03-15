import 'package:flags_quiz/models/country.dart';
import 'package:flutter/material.dart';

/// A widget that displays a country's flag image.
///
/// The `QuizImageWidget` class is a stateless widget that renders the flag
/// image of a given country. It uses the country's local asset image file
/// and displays it with specified dimensions. This widget is particularly
/// useful in quiz or quiz applications where flags need to be displayed
/// prominently.
///
/// The flag image is expected to be stored in the assets/images directory
/// with a filename that matches the country's code followed by `.png`.
class QuizImageWidget extends StatelessWidget {
  /// The country whose flag image is to be displayed.
  final Country country;

  /// The width of the flag image.
  final double width;

  /// The height of the flag image.
  final double height;

  /// Creates a `QuizImageWidget` with the specified country and dimensions.
  ///
  /// [key] is the unique key for this widget.
  /// [country] is the `Country` object containing information about the country.
  /// [width] is the width of the image to be displayed.
  /// [height] is the height of the image to be displayed.
  const QuizImageWidget(
      {required Key key,
        required this.country,
        required this.width,
        required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(country.flagLocalImage,
        key: Key("image_${country.code.toLowerCase()}"),
        width: width,
        height: height);
  }
}