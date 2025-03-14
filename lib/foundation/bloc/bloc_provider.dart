import 'package:flutter/cupertino.dart';
import 'bloc.dart';

/// A Flutter widget that provides a BLoC to its descendants.
///
/// The `BlocProvider` class is a generic widget that manages the lifecycle
/// of a BLoC instance. It provides the BLoC to its child widget and any
/// descendants through the widget tree, facilitating the use of the BLoC
/// pattern in a Flutter application. This widget ensures that the BLoC
/// is properly disposed of when it is no longer needed.
///
/// The `BlocProvider` widget should be used at a level in the widget tree
/// where the BLoC needs to be accessed by multiple widgets.
///
/// Example usage:
/// ```dart
/// BlocProvider(
///   bloc: CounterBloc(),
///   child: MyCounterWidget(),
/// )
/// ```
///
/// Descendant widgets can access the BLoC instance using the `BlocProvider.of` method:
/// ```dart
/// final bloc = BlocProvider.of<CounterBloc>(context);
/// ```
class BlocProvider<T extends Bloc> extends StatefulWidget {
  /// The child widget that can access the provided BLoC.
  final Widget child;

  /// The BLoC instance to be provided to the widget tree.
  final T bloc;

  /// Creates a `BlocProvider` widget.
  ///
  /// [bloc] is the BLoC instance that will be provided to the widget tree.
  /// [child] is the widget that will be the root of the widget subtree that can access the BLoC.
  const BlocProvider({super.key, required this.bloc, required this.child});

  /// Retrieves the BLoC instance from the nearest ancestor `BlocProvider` of the specified type.
  ///
  /// This static method searches the widget tree for a `BlocProvider` of type [T]
  /// and returns the BLoC instance. It should be called within the build method
  /// of a widget that is a descendant of a `BlocProvider`.
  ///
  /// Throws an error if no ancestor `BlocProvider` of the specified type is found.
  ///
  /// Example usage:
  /// ```dart
  /// final bloc = BlocProvider.of<CounterBloc>(context);
  /// ```
  static T of<T extends Bloc>(BuildContext context) {
    final BlocProvider<T>? provider = context.findAncestorWidgetOfExactType();
    return provider!.bloc;
  }

  @override
  State createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider> {
  @override
  Widget build(BuildContext context) => widget.child;

  /// Disposes the BLoC when the widget is removed from the widget tree.
  ///
  /// This method ensures that the BLoC's `dispose` method is called
  /// to release any resources and prevent memory leaks.
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}