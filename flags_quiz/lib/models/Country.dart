import 'package:flagsquiz/foundation/iterable_extension.dart';
import 'package:flagsquiz/models/Continent.dart';

class Country {
  static const _keyName = 'name';
  static const _keyContinent = 'continent';

  final String name;
  final Continent continent;

  Country.fromJson(Map json)
      : name = json[_keyName] as String,
        continent =
            getEnumFromString(Continent.values, json[_keyContinent] as String);
}
