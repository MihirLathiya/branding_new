import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class DownloadController extends GetxController {
  // File? file;
  // fileConvert({required List<Uint8List> imageInUnit8List}) async {
  //   final tempDir = await getTemporaryDirectory();
  //   file = await File('${tempDir.path}/image.png').create();
  //   file!.writeAsBytesSync(imageInUnit8List);
  //   update();
  //   return file;
  // }

  List<Map<String, dynamic>> downloadList = [
    {
      'image': 'https://wallpapercave.com/dwp1x/wp7133689.jpg',
      'date': '14 JAN',
    },
    {
      'image': 'https://wallpapercave.com/dwp1x/wp11910934.jpg',
      'date': '26 JAN',
    },
    {
      'image': 'https://wallpapercave.com/fuwp/uwp3318999.webp',
      'date': '14 FEB',
    },
    {
      'image': 'https://wallpapercave.com/dwp1x/wp10760239.jpg',
      'date': '8 MAR',
    },
  ];

  @override
  void onInit() {
    super.onInit();
  }
}
