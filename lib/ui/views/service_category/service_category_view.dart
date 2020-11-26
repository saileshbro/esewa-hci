import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/app_localizations.dart';
import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/helpers/show_not_implemented_toast.dart';
import 'package:esewa_hci/common/ui/screen_util.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:esewa_hci/setup_snackbar.dart';
import 'package:esewa_hci/ui/views/service_category/service_category_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

class ServiceCategoryView extends StatelessWidget {
  final String category;

  ServiceCategoryView({Key key, @required this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context).locale.languageCode;
    return ViewModelBuilder<ServiceCategoryViewModel>.reactive(
      viewModelBuilder: () => locator<ServiceCategoryViewModel>(),
      onModelReady: (model) => model.init(),
      builder: (
        BuildContext context,
        ServiceCategoryViewModel model,
        Widget child,
      ) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Localizations.override(
              context: context,
              locale: Locale('en'),
              child: AppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                centerTitle: true,
                title: Image.asset(
                  locator<ThemeService>().isDarkMode
                      ? AssetPaths.esewaLogoDarkPath
                      : AssetPaths.esewaLogoLightPath,
                  width: ScreenUtil.screenWidth * 0.35,
                ),
              ),
            ),
          ),
          body: ListView(
            padding: sPagePadding,
            children: [
              AutoSizeText(
                category,
                maxLines: 1,
                maxFontSize: Theme.of(context)
                    .textTheme
                    .headline4
                    .fontSize
                    .ceilToDouble(),
                style: Theme.of(context).textTheme.headline4.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              mHeightSpan,
              getServicesUi(context, model, locale)
            ],
          ),
        );
      },
    );
  }

  Widget getServicesUi(
      BuildContext context, ServiceCategoryViewModel model, String locale) {
    if (model.isBusy) {
      return Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: dimen_24,
        children: List.generate(
          15,
          (index) => SizedBox(
            width: (ScreenUtil.screenWidth - 4 * dimen_16) / 3,
            height: (ScreenUtil.screenWidth - 4 * dimen_16) / 3,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.4),
              highlightColor: Theme.of(context).canvasColor,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(dimen_8),
                  color: Theme.of(context).canvasColor,
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        locator<SnackbarService>().showCustomSnackBar(
          variant: SnackbarType.success,
          message: TranslationStrings.cashbackIsShown.t(context),
          title: TranslationStrings.cashback.t(context),
          mainButtonTitle: TranslationStrings.skip.t(context),
          onMainButtonTapped: () => locator<NavigationService>().back(),
          duration: Duration(seconds: 6),
        );
      });
      return Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: dimen_24,
        children: model.services
            .map((e) => Container(
                  width: (ScreenUtil.screenWidth - 4 * dimen_16) / 3,
                  child: Column(
                    children: [
                      Container(
                        height: (ScreenUtil.screenWidth - 4 * dimen_16) / 3,
                        padding: mPadding,
                        child: InkWell(
                          onTap: showNotImplementedToast,
                          borderRadius: BorderRadius.circular(dimen_8),
                          child: Badge(
                            showBadge: e.offer != null,
                            animationType: BadgeAnimationType.fade,
                            badgeContent: Padding(
                              padding: EdgeInsets.all(dimen_1),
                              child: Text(
                                (e.offer ?? "").split(" ").first,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: dimen_10.sp,
                                    ),
                              ),
                            ),
                            child: Container(
                              padding: mPadding,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(dimen_8),
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: dimen_2.w,
                                  )),
                              child: Center(
                                child: CachedNetworkImage(
                                  imageUrl: e.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      AutoSizeText(
                        e.displayName[locale ?? 'en'].split('-').first,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        maxFontSize: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .fontSize
                            .ceilToDouble(),
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ))
            .toList(),
      );
    }
  }
}
