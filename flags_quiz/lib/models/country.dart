import 'package:flagsquiz/foundation/iterable_extension.dart';
import 'package:flagsquiz/models/continent.dart';

class Country {
  static const _keyName = 'name';
  static const _keyContinent = 'continent';
  static const _keyCode = 'code';

  final String name;
  final Continent continent;
  final String code;

  String get flagImage => 'assets/images/$code.png';

  Country.fromJson(Map json)
      : name = json[_keyName] as String,
        continent =
            getEnumFromString(Continent.values, json[_keyContinent] as String),
        code = json[_keyCode] as String;
}
