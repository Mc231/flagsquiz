import 'package:flutter/cupertino.dart';
import 'bloc.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  const BlocProvider({Key? key, required this.bloc, required this.child})
      : super(key: key);

  static T of<T extends Bloc>(BuildContext context) {
    final BlocProvider<T>? provider = context.findAncestorWidgetOfExactType();
    if (provider == null) {
      throw FlutterError(
          'BlocProvider.of() called with a context that does not contain a BlocProvider of type $T.\n'
              'No ancestor could be found starting from the context that was passed to BlocProvider.of<$T>(). '
              'This can happen if the context you use comes from a widget above the BlocProvider.\n'
              'The context used was: $context'
      );
    }

    return provider.bloc;
  }

  @override
  State createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider> {
  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
