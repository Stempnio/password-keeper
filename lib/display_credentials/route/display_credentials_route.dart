import 'package:flutter/material.dart';

class DisplayCredentialsRoute<T> extends PageRoute<T> {
  DisplayCredentialsRoute({required WidgetBuilder builder})
      : _builder = builder;

  final WidgetBuilder _builder;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return _builder(context);
  }

  @override
  Color? get barrierColor => Colors.black54;

  @override
  String? get barrierLabel => 'Display credentials';

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;
}
