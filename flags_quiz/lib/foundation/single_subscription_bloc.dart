import 'dart:async';
import 'bloc.dart';

abstract class SingleSubscriptionBloc<S> extends Bloc {

  final StreamController<S> _controller = StreamController<S>();
  Stream<S> get stream => _controller.stream;

  S get initialState;

  void dispatchState(S state) {
    _controller.add(state);
  }

  @override
  void dispose() {
    _controller.close();
  }
}