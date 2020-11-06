import 'package:flutter/material.dart';

class DFloatingActionButton extends StatelessWidget {
  final Function onPressed;
  final bool loading;
  final Widget child;

  const DFloatingActionButton({
    Key key,
    @required this.onPressed,
    @required this.child,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: loading
          ? const CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : child,
    );
  }
}
