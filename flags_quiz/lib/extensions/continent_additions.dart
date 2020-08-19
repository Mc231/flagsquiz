import 'package:flagsquiz/models/continent.dart';
import 'package:flutter/cupertino.dart';

import '../localizations.dart';

extension ContinentAdditions on Continent {

  // ignore: missing_return
  String localizedName(BuildContext context) {
    var localizations = AppLocalizations.of(context);
    switch (this) {
      case Continent.ALL:
        return localizations.all;
      case Continent.AF:
        return localizations.africa;
      case Continent.EU:
        return localizations.europe;
      case Continent.AS:
        return localizations.asia;
      case Continent.NA:
        return localizations.northAmerica;
      case Continent.SA:
        return localizations.southAmerica;
      case Continent.OC:
        return localizations.oceania;
    }
  }
}