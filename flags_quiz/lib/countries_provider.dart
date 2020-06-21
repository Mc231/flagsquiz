import 'dart:convert';

import 'package:flagsquiz/foundation/resource_provider.dart';
import 'package:flagsquiz/models/country.dart';

import 'foundation/asset_provider.dart';

class CountriesProvider extends ResourceProvider<List<Country>> {
  final AssetProvider provider;

  const CountriesProvider(
      {this.provider = const AssetProvider('assets/Countries.json')});

  @override
  Future<List<Country>> provide() {
    return provider
        .provide()
        .then((source) => jsonDecode(source) as Map<String, dynamic>)
        .then((value) {
      var result = <Country>[];
      value.forEach((key, value) {
        var country = Country.fromJson(value as Map, key);
        result.add(country);
      });
      return result;
    });
  }
}
