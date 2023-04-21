import 'dart:developer';
import 'dart:io';

import 'package:branding/prefrence_manager/prefrence.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeController extends GetxController {
  CarouselController carouselController = CarouselController();

  int selectCarouselPage = 0;
  BannerAd? bannerAd;

  /// Banner Ad
  bool bannerAdIsLoaded = false;

  /// Rewarded Ad (Video Ad)
  RewardedAd? rewardedAd;
  bool isUpComingAdLoad = false;
  bool isCategoriesViewAdLoad = false;

  /// UPDATE CarouselPage INDEX
  updateCarouselPage(int value) {
    selectCarouselPage = value;
    update();
  }

  /// UPDATE Loader Value
  updateLoaderValue(bool value) {
    bannerAdIsLoaded = value;
    update();
  }

  /// GET ADS KEY
  getAdsKey() async {
    var data = await FirebaseFirestore.instance
        .collection('AdsKey')
        .doc('oIVAVFwOUxdEBRdV0Gh2')
        .get();
    Map<String, dynamic>? adsKey = data.data();
    PreferenceManager.setBannerAndroid(adsKey!['bannerAndroid'] ?? '');
    PreferenceManager.setBannerIos(adsKey['bannerIos'] ?? '');
    PreferenceManager.setRewardAndroid(adsKey['rewardAndroid'] ?? '');
    PreferenceManager.setRewardIos(adsKey['rewardIos'] ?? '');

    update();
  }

  /// LOAD BANNER ADD
  loadingAds() {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: Platform.isAndroid
            ? '${PreferenceManager.getBannerAndroid()}'
            : '${PreferenceManager.getBannerIos()}',
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) {
            log('$BannerAd loaded.');
            updateLoaderValue(true);
          },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            log('$BannerAd failedToLoad: $error');
            ad.dispose();
          },
          onAdOpened: (Ad ad) => log('$BannerAd onAdOpened.'),
          onAdClosed: (Ad ad) => log('$BannerAd onAdClosed.'),
        ),
        request: const AdRequest())
      ..load();
  }

  /// LOAD REWARD ADD
  void loadRewardedAd() {
    print('Enter in Rewarded Ad');
    RewardedAd.load(
      adUnitId: '${PreferenceManager.getRewardAndroid()}',
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              rewardedAd = null;
              print('------------------------Ad not showed');

              // loadRewardedAd();
            },
          );

          rewardedAd = ad;
          print('------------------------Ad showed');
          if (rewardedAd != null)
            rewardedAd?.show(
              onUserEarnedReward: (_, reward) {
                isUpComingAdLoad = true;
                isCategoriesViewAdLoad = true;

                update();
                print('------------------------Ad onUserEarnedReward ');
              },
            );
          update();
        },
        onAdFailedToLoad: (err) {
          isUpComingAdLoad = false;
          isCategoriesViewAdLoad = false;
          update();
          print('Failed to load a rewarded ad: ${err.message}');
        },
      ),
    );
    // _rewardedAd!.rewardedAdLoadCallback;
  }

  disposeAd() {
    bannerAd?.dispose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getAdsKey();
    super.onInit();
  }
}
