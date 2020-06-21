import 'package:flagsquiz/foundation/iterable_extension.dart';
import 'package:flagsquiz/models/continent.dart';

class Country {
  static const _keyName = 'name';
  static const _keyContinent = 'continent';

  final String name;
  final Continent continent;
  final String flag;

  String get flagImage => 'assets/images/$flag.png';

  Country.fromJson(Map json, String flag)
      : name = json[_keyName] as String,
        continent =
            getEnumFromString(Continent.values, json[_keyContinent] as String),
        flag = flag;
}
