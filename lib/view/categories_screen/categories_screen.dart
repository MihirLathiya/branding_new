import 'package:branding/constant/app_const_string.dart';
import 'package:branding/constant/color.dart';
import 'package:branding/constant/font_style.dart';
import 'package:branding/controller/categories_controller.dart';
import 'package:branding/view/home/view_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);
  CategoriesController categoriesController = Get.put(CategoriesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AppString.categories,
          style: FontTextStyle.kBlack24W600Poppins,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<CategoriesController>(
        builder: (controller) {
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
                    : MasonryGridView.count(
                        physics: BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 20.sp,
                        crossAxisSpacing: 20.sp,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.sp, vertical: 20.sp),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => ViewMoreImageScreen(
                                    title: '${data[index]['eventName']}',
                                    eventId: '${data[index]['docId']}',
                                  ));
                            },
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.sp),
                                  child: CachedNetworkImage(
                                    height: 200.sp,
                                    width: 200.sp,
                                    imageUrl: '${data[index]['thumbnail']}',
                                    fit: BoxFit.cover,
                                    errorWidget: (context, url, error) =>
                                        Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Icon(Icons.error_outline),
                                    ),
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Shimmer.fromColors(
                                      baseColor: Colors.grey.withOpacity(0.4),
                                      highlightColor:
                                          Colors.grey.withOpacity(0.2),
                                      enabled: true,
                                      child: Container(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 32.sp, vertical: 6.sp),
                                  margin: EdgeInsets.only(bottom: 10.sp),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.sp),
                                    color: AppColor.blue,
                                  ),
                                  child: Text(
                                    '${data[index]['eventName']}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: FontTextStyle.kWhite16W700Poppins,
                                  ),
                                )
                              ],
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
          );
        },
      ),
    );
  }
}
