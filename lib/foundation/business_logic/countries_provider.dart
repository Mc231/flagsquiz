import 'dart:convert';

import 'package:flags_quiz/foundation/asset_provider.dart';
import 'package:flags_quiz/foundation/resource_provider.dart';
import 'package:flags_quiz/models/country.dart';

/// A provider that loads country data from an asset file.
///
/// The `CountriesProvider` class is responsible for loading and parsing
/// a list of countries from a JSON asset file. It utilizes an `AssetProvider`
/// to access the asset file and provides the data as a list of `Country`
/// objects.
///
/// This class extends `ResourceProvider<List<Country>>`, leveraging
/// the generic interface to provide country data resources.
///
/// Constructors:
/// - `CountriesProvider`: Directly takes an `AssetProvider` to customize
///   the source of the JSON data.
/// - `CountriesProvider.standard`: Creates a standard instance using a default
///   asset file path (`assets/Countries.json`).
class CountriesProvider extends ResourceProvider<List<Country>> {
  /// The asset provider responsible for retrieving the country data asset.
  final AssetProvider provider;

  /// Creates a `CountriesProvider` with the given [provider].
  ///
  /// [provider] is an instance of `AssetProvider` that specifies
  /// where the country data JSON file is located.
  const CountriesProvider(this.provider);

  /// Creates a standard `CountriesProvider` using the default asset path.
  ///
  /// [path] is an optional parameter that specifies the path to the JSON file
  /// containing country data. By default, it is set to `'assets/Countries.json'`.
  ///
  /// This constructor uses `AssetProvider.mainBundleAssetProvider` to create
  /// an asset provider configured for the specified path.
  factory CountriesProvider.standard([String path = 'assets/Countries.json']) {
    final countriesProvider = AssetProvider.mainBundleAssetProvider(path);
    return CountriesProvider(countriesProvider);
  }

  /// Provides a list of `Country` objects by loading and parsing a JSON file.
  ///
  /// This method retrieves the country data from the asset using the
  /// `AssetProvider`, decodes the JSON content, and converts it into a list
  /// of `Country` objects using the `Country.fromJson` factory method.
  ///
  /// Returns a `Future` that completes with a list of `Country` objects
  /// parsed from the JSON data.
  ///
  /// Throws an exception if the asset loading or JSON decoding fails.
  @override
  Future<List<Country>> provide() {
    return provider
        .provide()
        .then((source) => jsonDecode(source) as List<dynamic>)
        .then((value) {
      var result = <Country>[];
      for (var element in value) {
        var country = Country.fromJson(element as Map);
        result.add(country);
      }
      return result;
    });
  }
}