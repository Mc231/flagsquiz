import 'package:flutter/material.dart';

/// Scroll container with exactly ony child and set default padding
class ScrollableSafeAreaContainer extends StatelessWidget {

  static const EdgeInsets defaultPadding = EdgeInsets.all(16);

  final EdgeInsets padding;
  final Widget child;

  double get heightOffset  => padding.top + padding.bottom;

  const ScrollableSafeAreaContainer(
      {Key key, this.padding = defaultPadding, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        padding: padding,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight -heightOffset,
          ),
          child: SafeArea(
            child: child,
          ),
        ),
      );
    });
  }
}