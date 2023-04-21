import 'dart:typed_data';

import 'package:get_storage/get_storage.dart';

class PreferenceManager {
  static GetStorage getStorage = GetStorage();
  static String name = "name";
  static String mobile = "mobile";
  static String email = "email";
  static String website = "website";
  static String address = "address";
  static String image = "image";
  static String bannerAndroid = "bannerAndroid";
  static String bannerIos = "bannerIos";
  static String rewardIos = "rewardIos";
  static String rewardAndroid = "rewardAndroid";
  static String brandIndex = "brandIndex";
  static String privateIndex = "privateIndex";

  ///Image
  static Future<Uint8List?> setImage(Uint8List value) async {
    await getStorage.write(image, value);
    return null;
  }

  static getImage() {
    return getStorage.read(image);
  }

  ///BANNER ADROID
  static Future<Uint8List?> setBannerAndroid(String value) async {
    await getStorage.write(bannerAndroid, value);
    return null;
  }

  static getBannerAndroid() {
    return getStorage.read(bannerAndroid);
  }

  ///BANNER IOS
  static Future<Uint8List?> setBannerIos(String value) async {
    await getStorage.write(bannerIos, value);
    return null;
  }

  static getBannerIos() {
    return getStorage.read(bannerIos);
  }

  ///REWARD ADROID
  static Future<Uint8List?> setRewardAndroid(String value) async {
    await getStorage.write(rewardAndroid, value);
    return null;
  }

  static getRewardAndroid() {
    return getStorage.read(rewardAndroid);
  }

  ///REWARD IOS
  static Future<Uint8List?> setRewardIos(String value) async {
    await getStorage.write(rewardIos, value);
    return null;
  }

  static getRewardIos() {
    return getStorage.read(rewardIos);
  }

  /// Brand Index
  static Future setBrandIndex(int value) async {
    await getStorage.write(brandIndex, value);
  }

  static getBrandIndex() {
    return getStorage.read(brandIndex);
  }

  /// Private Index
  static Future setPrivateIndex(int value) async {
    await getStorage.write(privateIndex, value);
  }

  static getPrivateIndex() {
    return getStorage.read(privateIndex);
  }

  ///Name
  static Future setName(String value) async {
    await getStorage.write(name, value);
  }

  static getName() {
    return getStorage.read(name);
  }

  ///mobile
  static Future setMobile(String value) async {
    await getStorage.write(mobile, value);
  }

  static getMobile() {
    return getStorage.read(mobile);
  }

  ///email
  static Future setEmail(String value) async {
    await getStorage.write(email, value);
  }

  static getEmail() {
    return getStorage.read(email);
  }

  ///website
  static Future setWebsite(String value) async {
    await getStorage.write(website, value);
  }

  static getWebsite() {
    return getStorage.read(website);
  }

  ///address
  static Future setAddress(String value) async {
    await getStorage.write(address, value);
  }

  static getAddress() {
    return getStorage.read(address);
  }

  static Future getClear() {
    return getStorage.erase();
  }
}
