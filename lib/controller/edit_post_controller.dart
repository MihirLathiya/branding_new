import 'package:branding/constant/image_path.dart';
import 'package:branding/prefrence_manager/prefrence.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:screenshot/screenshot.dart';

class EditPostController extends GetxController {
  ScreenshotController screenshotController = ScreenshotController();
  String name = '';
  String number = '';
  String email = '';
  String url = '';
  String address = '';
  Uint8List? logo;
  RewardedAd? rewardedAd;

  @override
  void onInit() {
    try {
      fonts = GoogleFonts.asMap().keys.toList();
    } catch (e) {
      print('----FONT ERROR---');
    }

    getAdsKey();

    name = PreferenceManager.getName() == '' ||
            PreferenceManager.getName().toString() == 'null'
        ? 'Name'
        : PreferenceManager.getName();
    number = PreferenceManager.getMobile() == '' ||
            PreferenceManager.getMobile().toString() == 'null'
        ? 'Mobile'
        : PreferenceManager.getMobile();
    email = PreferenceManager.getEmail() == '' ||
            PreferenceManager.getEmail().toString() == 'null'
        ? 'Email'
        : PreferenceManager.getEmail();
    url = PreferenceManager.getWebsite() == '' ||
            PreferenceManager.getWebsite().toString() == 'null'
        ? 'Website'
        : PreferenceManager.getWebsite();
    address = PreferenceManager.getAddress() == '' ||
            PreferenceManager.getAddress().toString() == 'null'
        ? 'Address'
        : PreferenceManager.getAddress();
    print(
        '---PreferenceManager.getImage() == null----${PreferenceManager.getImage() == null}');
    print(
        '---PreferenceManager.getImage() == null----${PreferenceManager.getImage().runtimeType}');
    ;
    logo = getImageBinary(PreferenceManager.getImage());
    super.onInit();
  }

  Uint8List getImageBinary(dynamicList) {
    try {
      List<int> intList =
          dynamicList.cast<int>().toList(); //This is the magical line.
      Uint8List data = Uint8List.fromList(intList);
      return data;
    } catch (e) {
      return Uint8List(10);
    }
  }

  /// FOR TAB BAR
  List<String> editType = [
    'Frame',
    'Graphic',
    'Logo Position',
    'Fonts',
    // 'Stokes'
  ];

  /// GRAPHIC LIST
  List<String> graphicList = [];

  /// FOR POSITION
  List<String> positionList = [
    'Top-Left',
    'Top-Center',
    'Top-Right',
    'Down-Left',
    'Down-Center',
    'Down-Right',
  ];

  /// FRAME LIST
  List<String> frameList = [
    ImagePath.frame1,
    ImagePath.frame2,
    ImagePath.frame3,
    ImagePath.frame4,
    ImagePath.frame5,
    ImagePath.frame6,
    ImagePath.frame7,
    ImagePath.frame8,
    ImagePath.frame9,
    ImagePath.frame10,
  ];

  /// FOR TAB BAR
  int selectType = 0;

  /// FOR SELECT FRAME
  int selectFrame = 0;
  int isShowFrameAdd = 0;

  /// FOR SELECT GRAPHIC
  int selectGraphic = 0;
  int isShowGraphicAdd = 0;

  /// FOR SELECT POSITION
  int selectPosition = 1;
  int isShowPositionAdd = 0;

  /// FOR SELECT STOCK
  // int selectStock = 0;
  // int isShowStockAdd = 0;

  /// FOR SELECT FONT
  int selectFont = 0;
  int isShowFontAdd = 0;

  List fonts = [];

  /// FOR INFOS
  bool profile = true;
  bool call = true;
  bool mail = true;
  bool location = true;
  bool website = true;
  bool image = true;

  /// FOR profile
  updateProfileType() {
    profile = !profile;
    update();
  }

  /// FOR call
  updateCallType() {
    call = !call;
    update();
  }

  /// FOR mail
  updateMailType() {
    mail = !mail;
    update();
  }

  /// FOR location
  updateLocationType() {
    location = !location;
    update();
  }

  /// FOR website
  updateWebSiteType() {
    website = !website;
    update();
  }

  /// FOR image
  updateImageType() {
    image = !image;
    update();
  }

  /// FOR TAB BAR
  updateSelectType(int value) {
    selectType = value;
    update();
  }

  /// FOR UPDATE FRAME
  updateUpdateFrame(int value) {
    selectFrame = value;
    update();
  }

  updateUpdateFrameAds() {
    isShowFrameAdd++;
    print('------FONT---$isShowFrameAdd');
    update();
  }

  updateUpdateFrame0() {
    isShowFrameAdd = 0;
    update();
  }

  /// FOR UPDATE GRAPHIC
  updateUpdateGraphic(int value) {
    selectGraphic = value;
    update();
  }

  updateUpdateGraphicAds() {
    isShowGraphicAdd++;
    update();
  }

  updateUpdateGraphicAds0() {
    isShowGraphicAdd = 0;
    update();
  }

  /// FOR UPDATE POSITION
  updateUpdatePosition(int value) {
    selectPosition = value;
    update();
  }

  updateUpdatePositionAds() {
    isShowPositionAdd++;
    update();
  }

  updateUpdatePositionAds0() {
    isShowPositionAdd = 0;
    update();
  }

  /// FOR UPDATE STOCK
  // updateUpdateStock(int value) {
  //   selectStock = value;
  //   update();
  // }
  //
  // updateUpdateStockAds() {
  //   isShowStockAdd++;
  //   update();
  // }
  //
  // updateUpdateStockAds0() {
  //   isShowStockAdd = 0;
  //   update();
  // }

  /// FOR UPDATE FONT
  updateUpdateFont(int value) {
    selectFont = value;
    update();
  }

  updateUpdateFontAds() {
    isShowFontAdd++;
    update();
  }

  updateUpdateFontAds0() {
    isShowFontAdd = 0;
    update();
  }

  /// Update graphicList
  updateGraphicList(List<String> graphic) {
    graphicList.clear();
    graphicList = graphic;
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
            },
          );

          rewardedAd = ad;
          print('------------------------Ad showed');
          if (rewardedAd != null)
            rewardedAd?.show(
              onUserEarnedReward: (_, reward) {
                update();
                print('------------------------Ad onUserEarnedReward ');
              },
            );
          update();
        },
        onAdFailedToLoad: (err) {
          update();
          print('Failed to load a rewarded ad: ${err.message}');
        },
      ),
    );
  }
}
