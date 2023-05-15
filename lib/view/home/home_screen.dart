import 'package:branding/common%20widget/tiles.dart';
import 'package:branding/constant/color.dart';
import 'package:branding/constant/font_style.dart';
import 'package:branding/constant/image_path.dart';
import 'package:branding/controller/home_controller.dart';
import 'package:branding/view/business_screen/edit_post_screen.dart';
import 'package:branding/view/home/privacy_policy.dart';
import 'package:branding/view/home/view_images.dart';
import 'package:branding/view/home/view_more_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeScreenController = Get.put(HomeController());
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void didChangeDependencies() {
    homeScreenController.loadingAds();

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    homeScreenController.disposeAd();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Container(
        width: 323.sp,
        height: Get.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 74.sp,
            ),
            SvgPicture.asset(
              ImagePath.name,
              height: 35.sp,
              width: 245.sp,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 75.sp,
            ),
            InkWell(
              onTap: () {
                // _scaffoldKey.currentState?.closeDrawer();
                Get.to(() => PrivacyPolicy());
              },
              child: Container(
                height: 47.sp,
                width: 291.sp,
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                decoration: BoxDecoration(
                  color: AppColor.offWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      ImagePath.privacy,
                      height: 24.sp,
                      width: 24.sp,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    Text(
                      'Privacy Policy',
                      style: TextStyle(fontSize: 18.sp),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.sp,
            ),
            InkWell(
              onTap: () {
                _scaffoldKey.currentState?.closeDrawer();
                homeScreenController.launchReviewUrl();
              },
              child: Container(
                height: 47.sp,
                width: 291.sp,
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                decoration: BoxDecoration(
                  color: AppColor.offWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      ImagePath.rateUs,
                      height: 24.sp,
                      width: 24.sp,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    Text(
                      'Rate Us',
                      style: TextStyle(fontSize: 18.sp),
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            Text(
              'Version 0.01',
              style: TextStyle(fontSize: 12.sp),
            ),
            SizedBox(
              height: 16.sp,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Center(
            child: SvgPicture.asset(
              ImagePath.drawer,
              height: 32.sp,
              width: 32.sp,
              fit: BoxFit.fill,
            ),
          ),
        ),
        title: SvgPicture.asset(
          ImagePath.name,
          height: 28.sp,
          width: 190.sp,
          fit: BoxFit.fill,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        builder: (homeController) {
          final BannerAd? bannerAd = homeController.bannerAd;
          return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Events')
                .orderBy('eventDate', descending: false)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data?.docs;
                return data!.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('No Events Available'),
                          ],
                        ),
                      )
                    : SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20.sp,
                            ),

                            /// CAROUSEL FOR TOP HEADING
                            StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('Banner')
                                  .orderBy('bannerDate', descending: false)
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<
                                          QuerySnapshot<Map<String, dynamic>>>
                                      bannerSnapshot) {
                                if (bannerSnapshot.hasData) {
                                  var data = bannerSnapshot.data?.docs;
                                  return Column(
                                    children: [
                                      data!.isEmpty
                                          ? SizedBox()
                                          : CarouselSlider.builder(
                                              carouselController: homeController
                                                  .carouselController,
                                              itemCount: data.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int itemIndex,
                                                      int pageViewIndex) {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: CachedNetworkImage(
                                                    height: 180.sp,
                                                    width: Get.width,
                                                    imageUrl:
                                                        '${data[itemIndex]['bannerImage']}',
                                                    fit: BoxFit.cover,
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Padding(
                                                      padding:
                                                          EdgeInsets.all(15.0),
                                                      child: Icon(
                                                          Icons.error_outline),
                                                    ),
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                            downloadProgress) {
                                                      return Shimmer.fromColors(
                                                        baseColor: Colors.grey
                                                            .withOpacity(0.4),
                                                        highlightColor: Colors
                                                            .grey
                                                            .withOpacity(0.2),
                                                        enabled: true,
                                                        child: Container(
                                                          color: Colors.white,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                              options: CarouselOptions(
                                                height: 180.sp,
                                                viewportFraction: 0.9,
                                                initialPage: homeController
                                                    .selectCarouselPage,
                                                enableInfiniteScroll: false,
                                                reverse: false,
                                                autoPlay: false,
                                                autoPlayInterval:
                                                    Duration(seconds: 3),
                                                autoPlayAnimationDuration:
                                                    Duration(milliseconds: 800),
                                                autoPlayCurve:
                                                    Curves.fastOutSlowIn,
                                                enlargeCenterPage: true,
                                                enlargeFactor: 0.2,
                                                onPageChanged: (index, reason) {
                                                  homeController
                                                      .updateCarouselPage(
                                                          index);
                                                },
                                                scrollDirection:
                                                    Axis.horizontal,
                                              ),
                                            ),
                                      SizedBox(
                                        height: 12.sp,
                                      ),

                                      /// INDICATORS
                                      data.isEmpty
                                          ? SizedBox()
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ...List.generate(
                                                  data.length,
                                                  (index) {
                                                    return homeController
                                                                .selectCarouselPage ==
                                                            index
                                                        ? Container(
                                                            height: 12.sp,
                                                            width: 12.sp,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: AppColor
                                                                  .blue0582CA,
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                      width: 3),
                                                            ),
                                                          )
                                                        : Container(
                                                            height: 8.sp,
                                                            width: 8.sp,
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        6.sp),
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: AppColor
                                                                  .blue0582CA,
                                                            ),
                                                          );
                                                  },
                                                )
                                              ],
                                            ),
                                    ],
                                  );
                                } else if (bannerSnapshot.hasError) {
                                  return Center(
                                    child: Text('Server Error'),
                                  );
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                            SizedBox(
                              height: 13.sp,
                            ),
                            homeController.bannerAdIsLoaded && bannerAd != null
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          height:
                                              bannerAd.size.height.toDouble(),
                                          width: bannerAd.size.width.toDouble(),
                                          child: AdWidget(ad: bannerAd)),
                                    ],
                                  )
                                : SizedBox(),
                            SizedBox(
                              height: 13.sp,
                            ),

                            /// UPCOMING EVENTS
                            data.isEmpty
                                ? SizedBox()
                                : HeadingTile(
                                    name: 'Upcoming Events',
                                    viewMore: () {
                                      Get.to(
                                        () => ViewMoreScreen(
                                          title: 'Upcoming Events',
                                        ),
                                      );
                                    },
                                  ),

                            data.isEmpty
                                ? Text('No Upcoming Events')
                                : SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    physics: BouncingScrollPhysics(),
                                    child: Row(
                                      children: [
                                        ...List.generate(
                                          data.length,
                                          (index) {
                                            DateTime dateOfEvent = DateTime
                                                .fromMillisecondsSinceEpoch(
                                                    (data[index]['eventDate']
                                                                as Timestamp)
                                                            .seconds *
                                                        1000);
                                            return data[index]['upcoming'] ==
                                                    true
                                                ? Padding(
                                                    padding: index == 0
                                                        ? EdgeInsets.only(
                                                            left: 16.sp,
                                                            right: 8.sp)
                                                        : EdgeInsets.symmetric(
                                                            horizontal: 8.0.sp),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Get.to(() =>
                                                            ViewMoreImageScreen(
                                                              title:
                                                                  '${data[index]['eventName']}',
                                                              eventId:
                                                                  '${data[index]['docId']}',
                                                            ));
                                                      },
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.sp),
                                                            child:
                                                                CachedNetworkImage(
                                                              height: 140.sp,
                                                              width: 140.sp,
                                                              imageUrl:
                                                                  '${data[index]['thumbnail']}',
                                                              fit: BoxFit.cover,
                                                              errorWidget:
                                                                  (context, url,
                                                                          error) =>
                                                                      Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            15.0),
                                                                child: Icon(Icons
                                                                    .error_outline),
                                                              ),
                                                              progressIndicatorBuilder:
                                                                  (context, url,
                                                                          downloadProgress) =>
                                                                      Shimmer
                                                                          .fromColors(
                                                                baseColor: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.4),
                                                                highlightColor:
                                                                    Colors.grey
                                                                        .withOpacity(
                                                                            0.2),
                                                                enabled: true,
                                                                child:
                                                                    Container(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        32.sp,
                                                                    vertical:
                                                                        6.sp),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.sp),
                                                              color:
                                                                  AppColor.blue,
                                                            ),
                                                            child: Text(
                                                              '${DateFormat.MMMd().format(dateOfEvent)}',
                                                              style: FontTextStyle
                                                                  .kWhite16W700Poppins,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : SizedBox();
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                            SizedBox(
                              height: 24.sp,
                            ),

                            /// Event 1
                            if (data.length >= 1)
                              HeadingTile(
                                name: '${data[0]['eventName']}',
                                viewMore: () {
                                  Get.to(
                                    () => ViewMoreImageScreen(
                                      title: '${data[0]['eventName']}',
                                      eventId: '${data[0]['docId']}',
                                    ),
                                  );
                                },
                              ),

                            if (data.length >= 1)
                              SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  child: StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection('Events')
                                        .doc(data[0].id)
                                        .collection('Eventimage')
                                        .snapshots(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<
                                                QuerySnapshot<
                                                    Map<String, dynamic>>>
                                            snap) {
                                      if (snap.hasData) {
                                        return Row(
                                          children: [
                                            ...List.generate(
                                              snap.data!.docs.length,
                                              (index) {
                                                var firstData = snap.data?.docs;
                                                return Padding(
                                                  padding: index == 0
                                                      ? EdgeInsets.only(
                                                          left: 16.sp,
                                                          right: 8.sp)
                                                      : EdgeInsets.symmetric(
                                                          horizontal: 8.0.sp),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      List<String> images = [];
                                                      for (int i = 0;
                                                          i < firstData.length;
                                                          i++) {
                                                        images.add(firstData[i]
                                                            ['image']);
                                                      }
                                                      Get.to(() =>
                                                          EditPostScreen(
                                                            imageLink:
                                                                '${firstData[index]['image']}',
                                                            graphicList: images,
                                                            index: index,
                                                          ));
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.sp),
                                                      child: CachedNetworkImage(
                                                        height: 140.sp,
                                                        width: 140.sp,
                                                        imageUrl:
                                                            '${firstData![index]['image']}',
                                                        fit: BoxFit.cover,
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  15.0),
                                                          child: Icon(Icons
                                                              .error_outline),
                                                        ),
                                                        progressIndicatorBuilder:
                                                            (context, url,
                                                                    downloadProgress) =>
                                                                Shimmer
                                                                    .fromColors(
                                                          baseColor: Colors.grey
                                                              .withOpacity(0.4),
                                                          highlightColor: Colors
                                                              .grey
                                                              .withOpacity(0.2),
                                                          enabled: true,
                                                          child: Container(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            )
                                          ],
                                        );
                                      } else if (snapshot.hasError) {
                                        return Center(
                                          child: Text('Server Error'),
                                        );
                                      } else {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    },
                                  )),
                            if (data.length >= 2)
                              SizedBox(
                                height: 16.sp,
                              ),

                            /// Event 2
                            if (data.length >= 2)
                              HeadingTile(
                                name: '${data[1]['eventName']}',
                                viewMore: () {
                                  Get.to(() => ViewMoreImageScreen(
                                        title: '${data[1]['eventName']}',
                                        eventId: '${data[1]['docId']}',
                                      ));
                                },
                              ),
                            if (data.length >= 2)
                              SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  child: StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection('Events')
                                        .doc(data[1].id)
                                        .collection('Eventimage')
                                        .snapshots(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<
                                                QuerySnapshot<
                                                    Map<String, dynamic>>>
                                            snap) {
                                      if (snap.hasData) {
                                        return Row(
                                          children: [
                                            ...List.generate(
                                              snap.data!.docs.length,
                                              (index) {
                                                var firstData = snap.data?.docs;
                                                return Padding(
                                                  padding: index == 0
                                                      ? EdgeInsets.only(
                                                          left: 16.sp,
                                                          right: 8.sp)
                                                      : EdgeInsets.symmetric(
                                                          horizontal: 8.0.sp),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      List<String> images = [];
                                                      for (int i = 0;
                                                          i < firstData.length;
                                                          i++) {
                                                        images.add(firstData[i]
                                                            ['image']);
                                                      }
                                                      Get.to(() =>
                                                          EditPostScreen(
                                                            imageLink:
                                                                '${firstData[index]['image']}',
                                                            graphicList: images,
                                                            index: index,
                                                          ));
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.sp),
                                                      child: CachedNetworkImage(
                                                        height: 140.sp,
                                                        width: 140.sp,
                                                        imageUrl:
                                                            '${firstData![index]['image']}',
                                                        fit: BoxFit.cover,
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  15.0),
                                                          child: Icon(Icons
                                                              .error_outline),
                                                        ),
                                                        progressIndicatorBuilder:
                                                            (context, url,
                                                                    downloadProgress) =>
                                                                Shimmer
                                                                    .fromColors(
                                                          baseColor: Colors.grey
                                                              .withOpacity(0.4),
                                                          highlightColor: Colors
                                                              .grey
                                                              .withOpacity(0.2),
                                                          enabled: true,
                                                          child: Container(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            )
                                          ],
                                        );
                                      } else if (snapshot.hasError) {
                                        return Center(
                                          child: Text('Server Error'),
                                        );
                                      } else {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    },
                                  )),

                            if (data.length >= 3)
                              SizedBox(
                                height: 16.sp,
                              ),

                            /// Event 3
                            if (data.length >= 3)
                              HeadingTile(
                                name: '${data[2]['eventName']}',
                                viewMore: () {
                                  Get.to(() => ViewMoreImageScreen(
                                        title: '${data[2]['eventName']}',
                                        eventId: '${data[2]['docId']}',
                                      ));
                                },
                              ),
                            if (data.length >= 3)
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                child: StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection('Events')
                                      .doc(data[2].id)
                                      .collection('Eventimage')
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<
                                              QuerySnapshot<
                                                  Map<String, dynamic>>>
                                          snap) {
                                    if (snap.hasData) {
                                      return Row(
                                        children: [
                                          ...List.generate(
                                            snap.data!.docs.length,
                                            (index) {
                                              var firstData = snap.data?.docs;
                                              return Padding(
                                                padding: index == 0
                                                    ? EdgeInsets.only(
                                                        left: 16.sp,
                                                        right: 8.sp)
                                                    : EdgeInsets.symmetric(
                                                        horizontal: 8.0.sp),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    List<String> images = [];
                                                    for (int i = 0;
                                                        i < firstData.length;
                                                        i++) {
                                                      images.add(firstData[i]
                                                          ['image']);
                                                    }
                                                    Get.to(() => EditPostScreen(
                                                          imageLink:
                                                              '${firstData[index]['image']}',
                                                          graphicList: images,
                                                          index: index,
                                                        ));
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.sp),
                                                    child: CachedNetworkImage(
                                                      height: 140.sp,
                                                      width: 140.sp,
                                                      imageUrl:
                                                          '${firstData![index]['image']}',
                                                      fit: BoxFit.cover,
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Padding(
                                                        padding: EdgeInsets.all(
                                                            15.0),
                                                        child: Icon(Icons
                                                            .error_outline),
                                                      ),
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                                  downloadProgress) =>
                                                              Shimmer
                                                                  .fromColors(
                                                        baseColor: Colors.grey
                                                            .withOpacity(0.4),
                                                        highlightColor: Colors
                                                            .grey
                                                            .withOpacity(0.2),
                                                        enabled: true,
                                                        child: Container(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          )
                                        ],
                                      );
                                    } else if (snapshot.hasError) {
                                      return Center(
                                        child: Text('Server Error'),
                                      );
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
                                ),
                              ),

                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Server Error'),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        },
      ),
    );
  }
}
