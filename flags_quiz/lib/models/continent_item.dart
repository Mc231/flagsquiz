import 'package:flutter/cupertino.dart';

import '../localizations.dart';
import 'continent.dart';

/// Represents continent item
class ContinentItem {
  final String title;
  final Continent continent;

  ContinentItem(this.title, this.continent);

  factory ContinentItem.fromContinent(
      Continent continent, BuildContext context) {
    var localizations = AppLocalizations.of(context);
    ContinentItem item;
    switch (continent) {
      case Continent.AF:
        item = ContinentItem(localizations.africa, Continent.AF);
        break;
      case Continent.EU:
        item = ContinentItem(localizations.europe, Continent.EU);
        break;
      case Continent.AS:
        item = ContinentItem(localizations.asia, Continent.AS);
        break;
      case Continent.NA:
        item = ContinentItem(localizations.northAmerica, Continent.NA);
        break;
      case Continent.SA:
        item = ContinentItem(localizations.southAmerica, Continent.SA);
        break;
      case Continent.OC:
        item = ContinentItem(localizations.oceania, Continent.OC);
        break;
    }
    return item;
  }

  static List<ContinentItem> allItems(BuildContext context) {
    final title = AppLocalizations.of(context).all;
    final item = ContinentItem(title, null);
    var result = <ContinentItem>[item];
    Continent.values.forEach((continent) {
      result.add(ContinentItem.fromContinent(continent, context));
    });
    return result;
  }
}