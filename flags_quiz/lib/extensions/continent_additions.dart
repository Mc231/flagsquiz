import 'package:flagsquiz/models/continent.dart';
import 'package:flagsquiz/ui/app_strings_delegate.dart';
import 'package:flutter/cupertino.dart';

extension ContinentAdditions on Continent {

  // ignore: missing_return
  String localizedName(BuildContext context) {
    final strings = AppStrings.of(context);
    switch (this) {
      case Continent.ALL:
        return strings.All;
      case Continent.AF:
        return strings.Africa;
      case Continent.EU:
        return strings.Europe;
      case Continent.AS:
        return strings.Asia;
      case Continent.NA:
        return strings.northAmerica;
      case Continent.SA:
        return strings.southAmerica;
      case Continent.OC:
        return strings.Oceania;
    }
  }
}