import 'package:flutter/material.dart';
import 'package:quiz_engine_core/quiz_engine_core.dart';

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
  final QuestionEntry entry;

  /// The width of the flag image.
  final double width;

  /// The height of the flag image.
  final double height;

  /// Creates a `QuizImageWidget` with the specified country and dimensions.
  ///
  /// [key] is the unique key for this widget.
  /// [entry] is the `Country` object containing information about the country.
  /// [width] is the width of the image to be displayed.
  /// [height] is the height of the image to be displayed.
  const QuizImageWidget(
      {required Key key,
        required this.entry,
        required this.width,
        required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flagImage = entry.otherOptions["image"] as String;
    final code = (entry.otherOptions["id"] as String).toLowerCase();
    return Image.asset(flagImage,
        key: Key("image_$code"),
        width: width,
        height: height);
  }
}