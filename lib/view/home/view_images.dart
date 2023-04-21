import 'package:branding/constant/color.dart';
import 'package:branding/constant/font_style.dart';
import 'package:branding/constant/image_path.dart';
import 'package:branding/controller/home_controller.dart';
import 'package:branding/view/business_screen/edit_post_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class ViewMoreImageScreen extends StatefulWidget {
  final String? title;
  final String? eventId;
  ViewMoreImageScreen({Key? key, this.title, this.eventId}) : super(key: key);

  @override
  State<ViewMoreImageScreen> createState() => _ViewMoreImageScreenState();
}

class _ViewMoreImageScreenState extends State<ViewMoreImageScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    if (homeController.isCategoriesViewAdLoad == false) {
      homeController.loadRewardedAd();
    }
    super.initState();
  }

  @override
  void dispose() {
    if (homeController.isCategoriesViewAdLoad == false) {
      homeController.rewardedAd?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.title!,
          style: FontTextStyle.kBlack24W600Poppins,
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Center(
            child: SvgPicture.asset(
              ImagePath.back,
              height: 32.sp,
              width: 32.sp,
            ),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Events')
            .doc(widget.eventId)
            .collection('Eventimage')
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data?.docs;
            return MasonryGridView.count(
              physics: BouncingScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 20.sp,
              crossAxisSpacing: 20.sp,
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 20.sp),
              itemCount: data?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    List<String> images = [];
                    for (int i = 0; i < data!.length; i++) {
                      images.add(data[i]['image']);
                    }
                    Get.to(() => EditPostScreen(
                          imageLink: '${data[index]['image']}',
                          graphicList: images,
                          index: index,
                        ));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.sp),
                    child: CachedNetworkImage(
                      height: 189.sp,
                      width: 189.sp,
                      imageUrl: '${data?[index]['image']}',
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Icon(Icons.error_outline),
                      ),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.4),
                          highlightColor: Colors.grey.withOpacity(0.2),
                          enabled: true,
                          child: Container(
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
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
    );
  }
}
