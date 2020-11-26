import 'package:esewa_hci/app/locator.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:flutter/material.dart';

class HomeStatsWidget extends StatelessWidget {
  final double balance;
  final double rewardPoints;

  const HomeStatsWidget({
    Key key,
    @required this.balance,
    @required this.rewardPoints,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(dimen_8),
        boxShadow: getBoxShadow(context, opacity: 0.2),
        color: locator<ThemeService>().isDarkMode
            ? Theme.of(context).canvasColor
            : Colors.white,
      ),
      padding: mPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TranslationStrings.dynNPR
                    .t(context, args: [balance.toString()]),
                style: Theme.of(context).textTheme.headline6.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              xsHeightSpan,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetPaths.npr,
                    height: dimen_12.h,
                  ),
                  xsWidthSpan,
                  Text(
                    TranslationStrings.balance.t(context),
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                rewardPoints.toString(),
                style: Theme.of(context).textTheme.headline6.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              xsHeightSpan,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetPaths.reward,
                    height: dimen_12.h,
                  ),
                  xsWidthSpan,
                  Text(
                    TranslationStrings.rewardPoints.t(context),
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
