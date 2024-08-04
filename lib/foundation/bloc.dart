/// A base class for implementing the BLoC (Business Logic Component) pattern.
///
/// The `Bloc` class serves as a foundation for creating business logic
/// components in a Flutter application. It provides a standard interface
/// for managing resources and ensuring proper cleanup when the component
/// is no longer needed. The BLoC pattern helps separate presentation from
/// business logic, promoting a cleaner and more maintainable architecture.
///
/// Classes that extend `Bloc` should override the `dispose` method to
/// release any resources, such as streams or controllers, to prevent
/// memory leaks.
///
/// Example usage:
/// ```dart
/// class CounterBloc extends Bloc {
///   final _countController = StreamController<int>();
///
///   Stream<int> get count => _countController.stream;
///
///   void increment() {
///     // Business logic for incrementing the counter
///   }
///
///   @override
///   void dispose() {
///     _countController.close();
///   }
/// }
/// ```
abstract class Bloc {
  /// Disposes of resources used by the BLoC.
  ///
  /// This method should be overridden by subclasses to perform any necessary
  /// cleanup, such as closing streams or controllers. This helps ensure that
  /// resources are properly released and prevents memory leaks.
  ///
  /// It is typically called when the BLoC is no longer needed, such as when
  /// a widget is disposed.
  void dispose();
}