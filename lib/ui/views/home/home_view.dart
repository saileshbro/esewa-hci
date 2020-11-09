import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/helpers/show_not_implemented_toast.dart';
import 'package:esewa_hci/common/ui/screen_util.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:esewa_hci/common/ui/widgets/home_stats_widget.dart';
import 'package:esewa_hci/common/ui/widgets/other_services_widget.dart';
import 'package:esewa_hci/common/ui/widgets/service_category_widget.dart';
import 'package:esewa_hci/common/ui/widgets/top_services_widget.dart';
import 'package:esewa_hci/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  final bottomNavItems = [
    _BottomNavItems(
      icon: AssetPaths.home,
      label: TranslationStrings.home,
    ),
    _BottomNavItems(
      icon: AssetPaths.statement,
      label: TranslationStrings.statement,
    ),
    _BottomNavItems(
      icon: AssetPaths.scan,
      label: TranslationStrings.scan,
    ),
    _BottomNavItems(
      icon: AssetPaths.myPayment,
      label: TranslationStrings.myPayment,
    ),
    _BottomNavItems(
      icon: AssetPaths.offers,
      label: TranslationStrings.offers,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => locator<HomeViewModel>(),
      disposeViewModel: false,
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget child,
      ) {
        return Scaffold(
          bottomNavigationBar: Localizations.override(
            context: context,
            locale: Locale('en'),
            child: BottomNavigationBar(
              onTap: (i) {
                if (i != 0) {
                  showNotImplementedToast();
                }
              },
              backgroundColor: Colors.white,
              elevation: 4.0,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(fontWeight: FontWeight.w600),
              unselectedLabelStyle: Theme.of(context).textTheme.caption,
              items: bottomNavItems
                  .map(
                    (e) => BottomNavigationBarItem(
                      icon: Image.asset(
                        e.icon,
                        height: dimen_12.h,
                      ),
                      label: e.label.t(context),
                    ),
                  )
                  .toList(),
            ),
          ),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Localizations.override(
              context: context,
              locale: Locale('en'),
              child: AppBar(
                backgroundColor: Colors.white,
                title: Image.asset(
                  AssetPaths.esewaLogoPath,
                  width: ScreenUtil.screenWidth * 0.35,
                ),
                leading: SizedBox.shrink(),
                leadingWidth: 0,
                actions: [
                  IconButton(
                    icon: Icon(Icons.search, size: dimen_30),
                    color: Theme.of(context).primaryColor,
                    onPressed: model.onSearchPressed,
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications_none, size: dimen_30),
                    color: Theme.of(context).primaryColor,
                    onPressed: model.onNotificationPressed,
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert, size: dimen_30),
                    color: Theme.of(context).primaryColor,
                    onPressed: model.onMorePressed,
                  ),
                ],
              ),
            ),
          ),
          body: ListView(
            padding: sPagePadding.add(sYPadding),
            children: [
              HomeStatsWidget(
                balance: 500,
                rewardPoints: 3000,
              ),
              llHeightSpan,
              Text(
                TranslationStrings.topServices.t(context),
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
              ),
              mHeightSpan,
              TopServicesWidget(),
              llHeightSpan,
              Text(
                TranslationStrings.otherServices.t(context),
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
              ),
              mHeightSpan,
              OtherServicesWidget(),
              llHeightSpan,
              Text(
                TranslationStrings.allCategories.t(context),
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
              ),
              mHeightSpan,
              ServiceCategoryWidget(
                onCategoryPressed: model.onCategoryPressed,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BottomNavItems {
  final String label;
  final String icon;

  const _BottomNavItems({this.label, this.icon});
}
