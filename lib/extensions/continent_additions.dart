import 'package:flagsquiz/models/continent.dart';
import 'package:flagsquiz/app_strings_delegate.dart';
import 'package:flutter/cupertino.dart';

extension ContinentAdditions on Continent {

  // ignore: missing_return
  String localizedName(BuildContext context) {
    final strings = AppStrings.of(context);
    switch (this) {
      case Continent.all:
        return strings.All;
      case Continent.af:
        return strings.Africa;
      case Continent.eu:
        return strings.Europe;
      case Continent.as:
        return strings.Asia;
      case Continent.na:
        return strings.northAmerica;
      case Continent.sa:
        return strings.southAmerica;
      case Continent.oc:
        return strings.Oceania;
    }
  }
}