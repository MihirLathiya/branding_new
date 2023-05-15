import 'package:branding/constant/image_path.dart';
import 'package:branding/view/business_screen/show_data_screen.dart';
import 'package:branding/view/categories_screen/categories_screen.dart';
import 'package:branding/view/download_screen/download_screen.dart';
import 'package:branding/view/home/home_screen.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController {
  int selectBottomBar = 0;

  List<Map<String, dynamic>> allEventDate = [];
  List<String> menu = [
    ImagePath.homeMenu,
    ImagePath.businessMenu,
    ImagePath.categoriesMenu,
    ImagePath.downloadMenu,
  ];

  List appScreen = [
    HomeScreen(),
    ShowDataScreen(),
    CategoriesScreen(),
    DownloadScreen(),
  ];

  updateBottomIndex(int value) {
    selectBottomBar = value;
    update();
  }

  /// THIS IS AUTO DELETE EVENT FUNCTION WHEN EVENT WAS COMPLETED
  // removeLastEventFromFirebase() async {
  //   await getEventDate();
  //   final todayDate = DateTime.now();
  //   // final difference = todayDate.difference(birthday).inDays;
  //
  //   for (int i = 0; i < allEventDate.length; i++) {
  //     final difference = (allEventDate[i]['eventDate'] as DateTime)
  //         .difference(todayDate)
  //         .inDays;
  //
  //     if (difference.toString().contains('-')) {
  //       var data = FirebaseFirestore.instance
  //           .collection('Events')
  //           .doc(allEventDate[i]['docId'])
  //           .collection('Eventimage');
  //       var info = await data.get();
  //       info.docs.forEach((element) {
  //         FirebaseFirestore.instance
  //             .collection('Events')
  //             .doc(allEventDate[i]['docId'])
  //             .collection('Eventimage')
  //             .doc(element.id)
  //             .delete();
  //       });
  //       await FirebaseFirestore.instance
  //           .collection('Events')
  //           .doc(allEventDate[i]['docId'])
  //           .delete();
  //       await FirebaseStorage.instance
  //           .ref("Event/${allEventDate[i]['eventName']}")
  //           .listAll()
  //           .then((value) {
  //         value.items.forEach((element) {
  //           FirebaseStorage.instance.ref(element.fullPath).delete();
  //         });
  //       });
  //     } else {
  //       print('-----HELLO----STAY');
  //     }
  //     print('---------DIFFRENT-----$difference');
  //   }
  // }

  // getEventDate() async {
  //   allEventDate.clear();
  //   var data = FirebaseFirestore.instance.collection('Events');
  //   var info = await data.get();
  //
  //   for (var element in info.docs) {
  //     DateTime dateOfEvent = DateTime.fromMillisecondsSinceEpoch(
  //         (element['eventDate'] as Timestamp).seconds * 1000);
  //     allEventDate.add({
  //       'eventDate': dateOfEvent,
  //       'docId': element['docId'],
  //       'eventName': element['eventName'].toString().trim().toString()
  //     });
  //   }
  //   print('--------DATETIME_______${allEventDate}');
  // }

  // @override
  // void onInit() {
  // removeLastEventFromFirebase();
  // super.onInit();
  // }
}
