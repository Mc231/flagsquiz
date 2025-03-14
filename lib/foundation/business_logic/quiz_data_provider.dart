import 'dart:convert';

import 'package:flags_quiz/foundation/asset_provider.dart';
import 'package:flags_quiz/foundation/resource_provider.dart';

/// A generic provider that loads quiz-related data from an asset file.
///
/// The `QuizDataProvider<T>` class loads and parses data from a JSON asset file
/// and converts it into a list of objects of type `T`. The class requires `T`
/// to have a `fromJson` factory constructor for conversion.
///
/// This is useful for loading various types of quiz-related data such as:
/// - Countries (`Country`)
/// - Questions (`Question<T>`)
/// - Answers (`Answer<T>`)
///
/// Example Usage:
/// ```dart
/// var countryProvider = QuizDataProvider<Country>.standard('assets/Countries.json', Country.fromJson);
/// List<Country> countries = await countryProvider.provide();
/// ```
class QuizDataProvider<T> extends ResourceProvider<List<T>> {
  /// The asset provider responsible for retrieving the data.
  final AssetProvider provider;

  /// The factory method used to create an instance of `T` from JSON.
  final T Function(Map<String, dynamic>) fromJson;

  /// Creates a `QuizDataProvider` with the given [provider] and [fromJson] function.
  const QuizDataProvider(this.provider, this.fromJson);

  /// Creates a standard `QuizDataProvider` using a default asset path.
  ///
  /// This constructor allows easy creation of quiz data providers by specifying
  /// the asset file path and the `fromJson` factory function.
  factory QuizDataProvider.standard(
      String path, T Function(Map<String, dynamic>) fromJson) {
    final dataProvider = AssetProvider.mainBundleAssetProvider(path);
    return QuizDataProvider(dataProvider, fromJson);
  }

  /// Loads and parses the asset file, converting it into a list of `T` objects.
  ///
  /// Uses the provided `fromJson` function to convert each JSON object
  /// into an instance of `T`.
  ///
  /// Throws an exception if the asset loading or JSON decoding fails.
  @override
  Future<List<T>> provide() async {
    final source = await provider.provide();
    final List<dynamic> jsonList = jsonDecode(source) as List<dynamic>;
    return jsonList.map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }
}