import 'package:branding/constant/image_path.dart';
import 'package:branding/prefrence_manager/prefrence.dart';
import 'package:branding/view/bottom_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<String> splashA = [
    ImagePath.splashA1,
    ImagePath.splashA2,
    ImagePath.splashA3,
    ImagePath.splashA4,
    ImagePath.splashA5,

    ///
    ImagePath.splashA1,
    ImagePath.splashA2,
    ImagePath.splashA3,
    ImagePath.splashA4,
    ImagePath.splashA5,

    ///
    ImagePath.splashA1,
    ImagePath.splashA2,
    ImagePath.splashA3,
    ImagePath.splashA4,
    ImagePath.splashA5,

    ///
    ImagePath.splashA1,
    ImagePath.splashA2,
    ImagePath.splashA3,
    ImagePath.splashA4,
    ImagePath.splashA5,

    ///
    ImagePath.splashA1,
    ImagePath.splashA2,
    ImagePath.splashA3,
    ImagePath.splashA4,
    ImagePath.splashA5,

    ///
    ImagePath.splashA1,
    ImagePath.splashA2,
    ImagePath.splashA3,
    ImagePath.splashA4,
    ImagePath.splashA5,
  ];
  List<String> splashB = [
    ImagePath.splashB1,
    ImagePath.splashB2,
    ImagePath.splashB3,
    ImagePath.splashB4,
    ImagePath.splashB1,

    ///
    ImagePath.splashB3,
    ImagePath.splashB4,
    ImagePath.splashB2,
    ImagePath.splashB1,
    ImagePath.splashB4,

    ///
    ImagePath.splashB1,
    ImagePath.splashB2,
    ImagePath.splashB3,
    ImagePath.splashB4,
    ImagePath.splashB1,

    ///
    ImagePath.splashB3,
    ImagePath.splashB4,
    ImagePath.splashB2,
    ImagePath.splashB1,
    ImagePath.splashB4,

    ///
    ImagePath.splashB1,
    ImagePath.splashB2,
    ImagePath.splashB3,
    ImagePath.splashB4,
    ImagePath.splashB1,

    ///
    ImagePath.splashB3,
    ImagePath.splashB4,
    ImagePath.splashB2,
    ImagePath.splashB1,
    ImagePath.splashB4,
  ];
  List<String> splashC = [
    ImagePath.splashC1,
    ImagePath.splashC2,
    ImagePath.splashC3,
    ImagePath.splashC4,
    ImagePath.splashC5,

    ///
    ImagePath.splashC1,
    ImagePath.splashC2,
    ImagePath.splashC3,
    ImagePath.splashC4,
    ImagePath.splashC5,

    ///
    ImagePath.splashC1,
    ImagePath.splashC2,
    ImagePath.splashC3,
    ImagePath.splashC4,
    ImagePath.splashC5,

    ///
    ImagePath.splashC1,
    ImagePath.splashC2,
    ImagePath.splashC3,
    ImagePath.splashC4,
    ImagePath.splashC5,

    ///
    ImagePath.splashC1,
    ImagePath.splashC2,
    ImagePath.splashC3,
    ImagePath.splashC4,
    ImagePath.splashC5,

    ///
    ImagePath.splashC1,
    ImagePath.splashC2,
    ImagePath.splashC3,
    ImagePath.splashC4,
    ImagePath.splashC5,
  ];

  ScrollController scrollController1 = ScrollController();
  ScrollController scrollController2 = ScrollController();
  ScrollController scrollController3 = ScrollController();

  getAdsKey() async {
    var data = await FirebaseFirestore.instance
        .collection('AdsKey')
        .doc('oIVAVFwOUxdEBRdV0Gh2')
        .get();
    Map<String, dynamic>? adsKey = data.data();
    setState(() {
      PreferenceManager.setBannerAndroid(adsKey!['bannerAndroid'] ?? '');
      PreferenceManager.setBannerIos(adsKey['bannerIos'] ?? '');
      PreferenceManager.setRewardAndroid(adsKey['rewardAndroid'] ?? '');
      PreferenceManager.setRewardIos(adsKey['rewardIos'] ?? '');
    });
  }

  @override
  void dispose() {
    scrollController1.removeListener(() {
      animateToMaxMin();
    });
    scrollController2.removeListener(() {
      animateToMaxMin();
    });
    scrollController3.removeListener(() {
      animateToMaxMin();
    });
    scrollController1.dispose();
    scrollController2.dispose();
    scrollController3.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getAdsKey();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double minScrollExtent1 = scrollController1.position.minScrollExtent;
      double maxScrollExtent1 = scrollController1.position.maxScrollExtent;
      double minScrollExtent2 = scrollController2.position.minScrollExtent;
      double maxScrollExtent2 = scrollController2.position.maxScrollExtent;
      double minScrollExtent3 = scrollController3.position.minScrollExtent;
      double maxScrollExtent3 = scrollController3.position.maxScrollExtent;
      animateToMaxMin(
          scrollController: scrollController1,
          direction: maxScrollExtent1,
          max: maxScrollExtent1,
          min: minScrollExtent1,
          sec: 30);
      animateToMaxMin(
          scrollController: scrollController2,
          direction: maxScrollExtent2,
          max: minScrollExtent2,
          min: maxScrollExtent2,
          sec: 30);
      animateToMaxMin(
          scrollController: scrollController3,
          direction: maxScrollExtent3,
          max: minScrollExtent3,
          min: maxScrollExtent3,
          sec: 30);
    });

    super.initState();
  }

  animateToMaxMin(
      {double? max,
      double? min,
      double? direction,
      int? sec,
      ScrollController? scrollController}) {
    scrollController!
        .animateTo(direction!,
            duration: Duration(seconds: sec!), curve: Curves.linear)
        .then((value) {
      direction = direction == max ? min : max;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            'asset/image/G1.png',
            height: Get.height,
            width: Get.width,
          ),
          Row(
            children: [
              ImagesListView(
                imageList: splashA,
                scrollController: scrollController1,
              ),
              ImagesListView1(
                imageList: splashB,
                scrollController: scrollController2,
              ),
              ImagesListView2(
                imageList: splashC,
                scrollController: scrollController3,
              ),
            ],
          ),
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0, -1),
                  end: Alignment(0, 1),
                  colors: <Color>[
                    Color(0x00020d12),
                    Color(0xff021f2e),
                  ],
                  stops: <double>[0, 1],
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Share Your Business',
                style: TextStyle(
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffFE8116),
                ),
              ),
              Text(
                'with Branding Post...',
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffEBEBEB),
                ),
              ),
              SizedBox(
                height: 40.sp,
              ),
              SizedBox(
                height: 51.sp,
                width: 280.sp,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Get.offAll(() => BottomBarScreen(pageIndex: 0));
                  },
                  child: Text(
                    'Get Start',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 34.sp,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ImagesListView extends StatelessWidget {
  final ScrollController scrollController;
  final List imageList;
  const ImagesListView(
      {Key? key, required this.scrollController, required this.imageList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        shrinkWrap: true,
        // scrollDirection: Axis.horizontal,
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 10),
            child: Image.asset(
              imageList[index],
              fit: BoxFit.cover,
              height: 152.sp,
              width: 400,
            ),
          );
        },
      ),
    );
  }
}

class ImagesListView1 extends StatelessWidget {
  final ScrollController scrollController;
  final List imageList;
  const ImagesListView1(
      {Key? key, required this.scrollController, required this.imageList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        shrinkWrap: true,
        reverse: true,
        // scrollDirection: Axis.horizontal,
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Image.asset(
              imageList[index],
              fit: BoxFit.cover,
              height: 152.sp,
              width: 400,
            ),
          );
        },
      ),
    );
  }
}

class ImagesListView2 extends StatelessWidget {
  final ScrollController scrollController;
  final List imageList;
  const ImagesListView2(
      {Key? key, required this.scrollController, required this.imageList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        shrinkWrap: true,

        // scrollDirection: Axis.horizontal,
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Image.asset(
              imageList[index],
              fit: BoxFit.cover,
              height: 152.sp,
            ),
          );
        },
      ),
    );
  }
}
