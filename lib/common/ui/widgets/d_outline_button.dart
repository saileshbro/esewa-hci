import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:esewa_hci/common/extensions/extensions.dart';

class DOutlineButton extends StatelessWidget {
  final bool loading;
  final String title;
  final VoidCallback onPressed;
  final bool disabled;
  final bool isExpanded;
  final bool fill;
  final Color color;

  const DOutlineButton({
    @required this.title,
    @required this.loading,
    @required this.onPressed,
    this.disabled = false,
    this.isExpanded = false,
    this.color,
    this.fill = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled || loading ? null : onPressed,
      child: InkWell(
        child: Container(
          height: dimen_48,
          width: isExpanded ? double.maxFinite : dimen_110,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(dimen_8.w),
              color: !fill
                  ? Colors.transparent
                  : color != null
                      ? color
                      : Theme.of(context).primaryColor,
              border: Border.all(
                  color: disabled
                      ? Theme.of(context).disabledColor
                      : color != null
                          ? color
                          : Theme.of(context).primaryColor,
                  width: dimen_2.w)),
          child: !loading
              ? Text(
                  title,
                  style: Theme.of(context).textTheme.button.copyWith(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                )
              : Container(
                  height: dimen_48.w,
                  width: dimen_48.w,
                  padding: sPadding,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
        ),
      ),
    );
  }
}
