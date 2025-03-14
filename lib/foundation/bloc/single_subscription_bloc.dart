import 'dart:async';

import 'bloc.dart';

/// A base class for implementing BLoC components with single subscription streams.
///
/// The `SingleSubscriptionBloc` class extends the `Bloc` base class and provides
/// a simple mechanism to manage states using a single-subscription stream. It
/// allows dispatching new states and exposes a stream for listening to these
/// state changes. This class is designed for use cases where only one listener
/// needs to subscribe to the stream at a time.
///
/// Example usage:
/// ```dart
/// class CounterBloc extends SingleSubscriptionBloc<int> {
///   @override
///   int get initialState => 0;
///
///   void increment() {
///     int newState = initialState + 1;
///     dispatchState(newState);
///   }
/// }
///
/// void main() {
///   final bloc = CounterBloc();
///   bloc.stream.listen((state) {
///     print('Current state: $state');
///   });
///
///   bloc.increment(); // Output: Current state: 1
/// }
/// ```
abstract class SingleSubscriptionBloc<S> extends Bloc {
  /// A stream controller for managing state changes.
  final StreamController<S> _controller = StreamController<S>();

  /// A stream that emits state changes to subscribers.
  ///
  /// The stream is a single-subscription stream, meaning that only one
  /// listener can subscribe to it at a time. This stream provides a mechanism
  /// to react to state changes within the BLoC.
  Stream<S> get stream => _controller.stream;

  /// The initial state of the BLoC.
  ///
  /// Subclasses must override this getter to provide the initial state
  /// for the BLoC. The initial state is emitted when the BLoC is first
  /// created or reset.
  S get initialState;

  /// Dispatches a new state to the stream.
  ///
  /// This method adds the given [state] to the stream, notifying any
  /// subscribed listeners of the state change. It is used to propagate
  /// state changes from within the BLoC to the UI or other parts of the
  /// application.
  ///
  /// [state] is the new state to be dispatched.
  void dispatchState(S state) {
    _controller.add(state);
  }

  /// Closes the stream controller and cleans up resources.
  ///
  /// This method is called to dispose of the BLoC, ensuring that the
  /// stream controller is closed and any associated resources are released.
  /// It prevents memory leaks by ensuring that open streams are properly
  /// terminated.
  @override
  void dispose() {
    _controller.close();
  }
}