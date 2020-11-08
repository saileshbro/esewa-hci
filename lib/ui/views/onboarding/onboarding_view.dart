import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:esewa_hci/common/ui/widgets/d_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stacked/stacked.dart';
import 'package:esewa_hci/common/extensions/extensions.dart';
import 'package:esewa_hci/ui/views/onboarding/onboarding_viewmodel.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class OnboardingView extends StatelessWidget {
  final PageController _pageController = PageController();
  final List<_OnboardingModel> onboardingItems = [
    _OnboardingModel(
      headLine: TranslationStrings.simpleAndFast,
      baseLine: TranslationStrings.wayToRechargeYourMobile,
      displayWidget: Container(
        padding: sPadding,
        height: dimen_140.h,
        width: double.infinity,
        child: Image.asset(AssetPaths.simpleAndFastIllustration),
      ),
    ),
    _OnboardingModel(
      headLine: TranslationStrings.loadFund,
      baseLine: TranslationStrings.easierWayToLoadFund,
      displayWidget: Container(
        padding: sPadding,
        height: dimen_140.h,
        width: double.infinity,
        child: Image.asset(AssetPaths.loadFundIllustration),
      ),
    ),
    _OnboardingModel(
      headLine: TranslationStrings.scanToPay,
      baseLine: TranslationStrings.payAtYoutFav,
      displayWidget: Container(
        padding: sPadding,
        height: dimen_140.h,
        width: double.infinity,
        child: Image.asset(AssetPaths.scanToPayIllustration),
      ),
    ),
    _OnboardingModel(
      headLine: TranslationStrings.manyMore,
      baseLine: TranslationStrings.buyAirlines,
      displayWidget: Container(
        padding: sPadding,
        height: dimen_140.h,
        width: double.infinity,
        child: Image.asset(AssetPaths.manyMoreIllustration),
      ),
    ),
    _OnboardingModel(
      headLine: TranslationStrings.learnMore,
      baseLine: TranslationStrings.watchTheVideo,
      displayWidget: Align(
        alignment: Alignment.center,
        child: YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId: '0Eb2ruOZ53w',
            flags: YoutubePlayerFlags(
              autoPlay: false,
              mute: true,
            ),
          ),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
        builder: (BuildContext context, OnboardingViewModel model, Widget _) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: sPagePadding,
              child: Column(
                children: <Widget>[
                  lHeightSpan,
                  Expanded(
                    flex: 6,
                    child: PageView.builder(
                      onPageChanged: model.setIndex,
                      physics: const BouncingScrollPhysics(),
                      controller: _pageController,
                      itemCount: onboardingItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _OnboardingFront(
                          onboardingModel: onboardingItems[index],
                        );
                      },
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        const Spacer(),
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: onboardingItems.length,
                          effect: WormEffect(
                            activeDotColor: Theme.of(context).primaryColor,
                            dotColor: Theme.of(context).primaryColor,
                            paintStyle: PaintingStyle.stroke,
                            dotHeight: dimen_12.w,
                            dotWidth: dimen_12.w,
                            radius: dimen_12.w,
                            strokeWidth: dimen_2.w,
                          ),
                        ),
                        xlHeightSpan,
                        model.currentIndex == onboardingItems.length - 1
                            ? DRaisedButton(
                                onPressed: model.onGetStartedPressed,
                                title: TranslationStrings.getStarted.t(context),
                                loading: false,
                                isExpanded: true,
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  DRaisedButton(
                                    onPressed: () {
                                      _pageController.animateToPage(
                                          onboardingItems.length - 1,
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.easeInOut);
                                    },
                                    title: TranslationStrings.skip.t(context),
                                    loading: false,
                                  ),
                                  DRaisedButton(
                                    onPressed: () {
                                      _pageController.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.easeInOut);
                                    },
                                    title: TranslationStrings.next.t(context),
                                    loading: false,
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        viewModelBuilder: () => locator<OnboardingViewModel>());
  }
}

class _OnboardingFront extends StatelessWidget {
  final _OnboardingModel onboardingModel;

  const _OnboardingFront({Key key, @required this.onboardingModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(flex: 7, child: onboardingModel.displayWidget),
        sHeightSpan,
        Expanded(
          flex: 3,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: sPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    onboardingModel.headLine.t(context),
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                  sHeightSpan,
                  Text(
                    onboardingModel.baseLine.t(context),
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _OnboardingModel {
  final String headLine;
  final String baseLine;
  final Widget displayWidget;

  _OnboardingModel({
    @required this.headLine,
    @required this.baseLine,
    @required this.displayWidget,
  });
}
