import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import "package:esewa_hci/app/locator.dart";

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
          ? CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                !locator<ThemeService>().isDarkMode
                    ? Colors.white
                    : Colors.black,
              ),
            )
          : child,
    );
  }
}
