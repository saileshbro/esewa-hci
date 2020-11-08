import 'package:auto_size_text/auto_size_text.dart';
import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

void showCustomToast({
  String message,
}) {
  showToastWidget(
    Container(
      padding: sPadding,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(dimen_8),
      ),
      child: AutoSizeText(
        message,
        maxLines: 2,
        minFontSize: dimen_14.sp.ceilToDouble(),
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
