/// Base class for providing resources
abstract class ResourceProvider<T> {
  const ResourceProvider();
  Future<T> provide();
}
