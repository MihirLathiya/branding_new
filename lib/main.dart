import 'package:branding/constant/color.dart';
import 'package:branding/constant/constant.dart';
import 'package:branding/hive_model/business_branding_model.dart';
import 'package:branding/hive_model/download.dart';
import 'package:branding/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'hive_model/personal_branding_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  MobileAds.instance.initialize();
  Hive.registerAdapter(PersonalBrandingModelAdapter());
  Hive.registerAdapter(BusinessBrandingModelAdapter());
  Hive.registerAdapter(DownloadImageModelAdapter());
  await Hive.openBox<PersonalBrandingModel>(AppConstant.personalDataBoxName);
  await Hive.openBox<BusinessBrandingModel>(AppConstant.businessDataBoxName);
  await Hive.openBox<DownloadImageModel>(AppConstant.downloadDataBoxName);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
            title: 'Branding',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                fontFamily: "Poppins",
                primarySwatch: Colors.blue,
                scaffoldBackgroundColor: AppColor.white,
                appBarTheme: AppBarTheme(color: AppColor.offWhite)),
            home: SplashScreen()
            // BottomBarScreen(pageIndex: 0),
            );
      },
    );
  }
}
