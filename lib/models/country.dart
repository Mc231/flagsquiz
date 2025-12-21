import 'package:flags_quiz/extensions/iterable_extension.dart';
import 'package:flags_quiz/models/continent.dart';
import 'package:quiz_engine_core/quiz_engine_core.dart';

/// Represents a country with its name, continent, and country code.
///
/// The `Country` class is used to model information about a country,
/// including its name, the continent it belongs to, and its country code.
/// It also provides a utility to get the path of the country's flag image
/// stored locally in the application assets.
///
/// This class is particularly useful in applications that deal with
/// geographic data, quizzes, or any scenario where countries need
/// to be categorized by continent or identified by their code.
///
class Country {
  static const _keyName = 'name';
  static const _keyContinent = 'continent';
  static const _keyCode = 'code';

  /// The name of the country.
  final String name;

  /// The continent to which the country belongs.
  final Continent continent;

  /// The ISO 3166-1 alpha-2 country code.
  final String code;

  /// Localized country name
  final String localizedCountryName;

  /// Returns the local asset path for the country's flag image.
  ///
  /// This property constructs the path to the flag image based on the
  /// country's code. The flag images are assumed to be stored in the
  /// `assets/images` directory with the filename format `<code>.png`.
  String get flagLocalImage => 'assets/images/$code.png';

  /// Creates a `Country` instance from a JSON object.
  ///
  /// This constructor extracts the `name`, `continent`, and `code` from
  /// the provided JSON map. It uses the `getEnumFromString` function
  /// to convert the continent string to a `Continent` enum value.
  ///
  /// [json] is a map containing the country's data with keys 'name',
  /// 'continent', and 'code'.
  Country.fromJson(Map json, String Function(String) resolveKey)
      : name = json[_keyName] as String,
        continent = getEnumFromString(Continent.values,
            (json[_keyContinent] as String).toLowerCase(), Continent.all),
        code = json[_keyCode] as String,
        localizedCountryName = resolveKey(json[_keyCode] as String);

  QuestionEntry get toQuestionEntry {
    return QuestionEntry(
      type: ImageQuestion(flagLocalImage),
      otherOptions: {
        "correctAnswer": name,
        "continent": continent.name,
        "id": code,
        "name": localizedCountryName,
      },
    );
  }
}
