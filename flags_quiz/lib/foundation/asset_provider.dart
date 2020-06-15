import 'package:flagsquiz/foundation/resource_provider.dart';
import 'package:flutter/services.dart';

class AssetProvider extends ResourceProvider<String> {

  final String path;

  const AssetProvider(this.path);

  /// Provide file by its path
  @override
  Future<String> provide() {
    return rootBundle.loadString(path);
  }
}