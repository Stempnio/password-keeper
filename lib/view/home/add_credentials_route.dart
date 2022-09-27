import 'package:flutter/material.dart';

class AddCredentialsRoute<T> extends PageRoute<T> {
  AddCredentialsRoute({required WidgetBuilder builder}) : _builder = builder;

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
  Color? get barrierColor => Colors.black12;

  @override
  String? get barrierLabel => 'Add credentials';

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;
}
