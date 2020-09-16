import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestApp extends StatelessWidget {
  final Widget child;

  const TestApp({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: child);
  }
}