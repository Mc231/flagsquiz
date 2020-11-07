import 'package:flagsquiz/foundation/resource_provider.dart';
import 'package:flutter/services.dart';

class AssetProvider extends ResourceProvider<String> {
  final String path;
  final AssetBundle bundle;

  const AssetProvider(this.path, this.bundle);

  factory AssetProvider.mainBundleAssetProvider(String path) {
    return AssetProvider(path, rootBundle);
  }

  /// Provide file by its path
  @override
  Future<String> provide() {
    return bundle.loadString(path);
  }
}
