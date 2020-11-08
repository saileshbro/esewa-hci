import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:esewa_hci/common/extensions/extensions.dart';

class LanguageSwitchButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final onPressed;
  const LanguageSwitchButton({
    Key key,
    @required this.label,
    this.isSelected = false,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: isSelected ? Constants.primaryGreen : Colors.white,
          borderRadius: BorderRadius.circular(dimen_12.w),
          boxShadow: getBoxShadow(context, opacity: 0.2),
        ),
        padding: lPadding.add(lYPadding),
        child: Text(
          label ?? "",
          style: Theme.of(context).textTheme.headline5.copyWith(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
        ),
      ),
    );
  }
}
