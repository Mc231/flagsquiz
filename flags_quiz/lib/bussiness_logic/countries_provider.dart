import 'dart:convert';

import 'package:flagsquiz/foundation/asset_provider.dart';
import 'package:flagsquiz/foundation/resource_provider.dart';
import 'package:flagsquiz/models/country.dart';

class CountriesProvider extends ResourceProvider<List<Country>> {
  final AssetProvider provider;

  const CountriesProvider(this.provider);

  factory CountriesProvider.standard([String path = 'assets/Countries.json']) {
    final countriesProvider = AssetProvider.mainBundleAssetProvider(path);
    return CountriesProvider(countriesProvider);
  }

  @override
  Future<List<Country>> provide() {
    return provider
        .provide()
        .then((source) => jsonDecode(source) as List<dynamic>)
        .then((value) {
      var result = <Country>[];
      value.forEach((element) {
        var country = Country.fromJson(element as Map);
        result.add(country);
      });
      return result;
    });
  }
}
