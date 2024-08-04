import 'package:flags_quiz/foundation/resource_provider.dart';
import 'package:flutter/services.dart';

/// A provider for loading assets from an asset bundle.
///
/// The `AssetProvider` class extends `ResourceProvider<String>` and is
/// responsible for loading and providing the contents of an asset file
/// as a string. It utilizes Flutter's `AssetBundle` to access the assets,
/// making it useful for reading data from files packaged with the app.
///
/// This class can be used to load configuration files, localized strings,
/// JSON data, or any other text-based resources bundled with the application.
///
/// Constructors:
/// - `AssetProvider`: Takes a file path and an `AssetBundle` to customize
///   the source of the asset data.
/// - `AssetProvider.mainBundleAssetProvider`: Provides a standard instance
///   using the default asset bundle (`rootBundle`) and the specified file path.
///
class AssetProvider extends ResourceProvider<String> {
  /// The path to the asset file within the asset bundle.
  final String path;

  /// The asset bundle used to load the asset file.
  final AssetBundle bundle;

  /// Creates an `AssetProvider` with the given [path] and [bundle].
  ///
  /// [path] specifies the location of the asset file to be loaded.
  /// [bundle] is the `AssetBundle` instance used to access the asset.
  const AssetProvider(this.path, this.bundle);

  /// Creates a standard `AssetProvider` using the main asset bundle.
  ///
  /// [path] specifies the location of the asset file to be loaded.
  /// This constructor uses `rootBundle` as the default asset bundle.
  factory AssetProvider.mainBundleAssetProvider(String path) {
    return AssetProvider(path, rootBundle);
  }

  /// Loads and returns the content of the asset file as a string.
  ///
  /// This method reads the asset file specified by [path] using the
  /// provided `AssetBundle` and returns its content as a string.
  ///
  /// Returns a `Future<String>` that completes with the file content.
  ///
  /// Throws a `FlutterError` if the asset cannot be loaded.
  @override
  Future<String> provide() {
    return bundle.loadString(path);
  }
}