import 'package:flagsquiz/models/continent.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

extension ContinentAdditions on Continent {

  String? localizedName(BuildContext context) {
    final strings = AppLocalizations.of(context);
    switch (this) {
      case Continent.all:
        return strings?.all;
      case Continent.af:
        return strings?.africa;
      case Continent.eu:
        return strings?.europe;
      case Continent.as:
        return strings?.asia;
      case Continent.na:
        return strings?.northAmerica;
      case Continent.sa:
        return strings?.southAmerica;
      case Continent.oc:
        return strings?.oceania;
      default:
        return null;
    }
  }
}