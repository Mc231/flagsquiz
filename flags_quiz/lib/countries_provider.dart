import 'dart:convert';

import 'package:flagsquiz/foundation/resource_provider.dart';
import 'package:flagsquiz/models/Country.dart';

import 'foundation/asset_provider.dart';

class CountriesProvider extends ResourceProvider<Map<String, Country>> {
  final AssetProvider provider;

  const CountriesProvider(
      {this.provider = const AssetProvider('assets/Countries.json')});

  @override
  Future<Map<String, Country>> provide() {
    return provider
        .provide()
        .then((source) => jsonDecode(source) as Map<String, dynamic>)
        .then((value) {
      return value.map((key, value) {
        var country = Country.fromJson(value as Map);
        return MapEntry(key, country);
      });
    });
  }
}
