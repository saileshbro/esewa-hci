import 'package:auto_size_text/auto_size_text.dart';
import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/helpers/show_not_implemented_toast.dart';
import 'package:esewa_hci/common/ui/screen_util.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:flutter/material.dart';

class OtherServicesWidget extends StatelessWidget {
  final services = [
    _OtherServiceModel(
      icon: AssetPaths.tv,
      label: TranslationStrings.tv,
    ),
    _OtherServiceModel(
      icon: AssetPaths.schoolFee,
      label: TranslationStrings.schoolFee,
    ),
    _OtherServiceModel(
      icon: AssetPaths.topUp,
      label: TranslationStrings.topUp,
    ),
    _OtherServiceModel(
      icon: AssetPaths.electricity,
      label: TranslationStrings.electricity,
    ),
    _OtherServiceModel(
      icon: AssetPaths.drinkingWater,
      label: TranslationStrings.drinkingWater,
    ),
    _OtherServiceModel(
      icon: AssetPaths.internet,
      label: TranslationStrings.internet,
    ),
    _OtherServiceModel(
      icon: AssetPaths.airlines,
      label: TranslationStrings.airlines,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.screenHeight * 0.13,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        itemBuilder: (context, index) => Material(
          color: Colors.white,
          child: InkWell(
            onTap: showNotImplementedToast,
            borderRadius: BorderRadius.circular(dimen_8),
            child: Container(
              padding: sPadding,
              width: ScreenUtil.screenWidth * 0.22,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(dimen_8),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: dimen_2.w,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    services[index].icon,
                    height: dimen_16.h,
                  ),
                  xsHeightSpan,
                  AutoSizeText(
                    services[index].label.t(context),
                    textAlign: TextAlign.center,
                    maxFontSize: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .fontSize
                        .ceilToDouble(),
                    maxLines: 2,
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
        separatorBuilder: (BuildContext context, int index) {
          if (index < services.length - 1) {
            return mWidthSpan;
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}

class _OtherServiceModel {
  final String label;
  final String icon;

  const _OtherServiceModel({this.label, this.icon});
}
