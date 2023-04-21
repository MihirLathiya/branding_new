import 'dart:io';
import 'dart:typed_data';

import 'package:branding/common%20widget/frame1.dart';
import 'package:branding/common%20widget/frame10.dart';
import 'package:branding/common%20widget/frame2.dart';
import 'package:branding/common%20widget/frame3.dart';
import 'package:branding/common%20widget/frame4.dart';
import 'package:branding/common%20widget/frame5.dart';
import 'package:branding/common%20widget/frame6.dart';
import 'package:branding/common%20widget/frame7.dart';
import 'package:branding/common%20widget/frame8.dart';
import 'package:branding/common%20widget/frame9.dart';
import 'package:branding/constant/color.dart';
import 'package:branding/constant/font_style.dart';
import 'package:branding/constant/image_path.dart';
import 'package:branding/controller/edit_post_controller.dart';
import 'package:branding/controller/home_controller.dart';
import 'package:branding/hive_model/boxes/boxes.dart';
import 'package:branding/hive_model/download.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class EditPostScreen extends StatefulWidget {
  final String imageLink;
  final List<String> graphicList;
  final int index;
  EditPostScreen(
      {Key? key,
      required this.imageLink,
      required this.graphicList,
      required this.index})
      : super(key: key);

  @override
  State<EditPostScreen> createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen>
    with SingleTickerProviderStateMixin {
  EditPostController editPostController = Get.put(EditPostController());
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    editPostController.updateUpdateGraphic(widget.index);
    editPostController.updateGraphicList(widget.graphicList);
    super.initState();
  }

  showRewardAd(EditPostController controller) async {
    controller.loadRewardedAd();
  }

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: editPostController.screenshotController,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Branding Post',
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
          actions: [
            GetBuilder<EditPostController>(
              builder: (controller) {
                return GestureDetector(
                  onTap: () {
                    Get.generalDialog(
                      barrierDismissible: true,
                      barrierLabel: '',
                      pageBuilder: (BuildContext buildContext,
                          Animation animation, Animation secondaryAnimation) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.all(16.sp),
                          // this padding user for outside of alert padding
                          insetPadding: EdgeInsets.symmetric(horizontal: 16),
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.sp)),
                          content: Container(
                            height: 450.sp,
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.sp),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: buildImage1(
                                      controller, 366.sp, 275.sp, 250.sp),
                                ),
                                SizedBox(
                                  height: 15.sp,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: 51.sp,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: AppColor.black),
                                          onPressed: () async {
                                            var image = await editPostController
                                                .screenshotController
                                                .captureFromWidget(buildImage1(
                                                    controller,
                                                    400.sp,
                                                    288.sp,
                                                    285.sp));
                                            if (image == null) return;

                                            await saveImage(image);

                                            DownloadImageModel downloadModel =
                                                DownloadImageModel(
                                                    imageDownload: image,
                                                    dateTimeDownload:
                                                        DateTime.now()
                                                            .toString());
                                            final box = Boxes.getDownloadData();
                                            box.add(downloadModel);
                                            downloadModel.save();

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content:
                                                    Text('Image Downloaded'),
                                              ),
                                            );
                                            Get.back();
                                          },
                                          child: Text('Download'),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.sp,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        height: 51.sp,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: AppColor.black),
                                          onPressed: () async {
                                            var image = await editPostController
                                                .screenshotController
                                                .captureFromWidget(buildImage1(
                                                    controller,
                                                    400.sp,
                                                    288.sp,
                                                    285.sp));
                                            await shareAndSaveImage(image);

                                            Get.back();
                                          },
                                          child: Text('Share'),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Center(
                    child: SvgPicture.asset(
                      ImagePath.download,
                      height: 32.sp,
                      width: 32.sp,
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              width: 16.w,
            )
          ],
        ),
        body: GetBuilder<EditPostController>(
          builder: (controller) {
            return Column(
              children: [
                SizedBox(
                  height: 20.sp,
                ),
                buildImage1(controller, 400.sp, 288.sp, 285.sp),
                SizedBox(
                  height: 24.sp,
                ),
                Container(
                  height: 44.sp,
                  width: Get.width,
                  color: AppColor.offWhite,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            controller.updateProfileType();
                          },
                          child: SvgPicture.asset(
                            controller.profile == true
                                ? ImagePath.on
                                : ImagePath.on50,
                            height: 32.sp,
                            width: 32.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            controller.updateCallType();
                          },
                          child: SvgPicture.asset(
                            controller.call == true
                                ? ImagePath.phone
                                : ImagePath.phone50,
                            height: 32.sp,
                            width: 32.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            controller.updateMailType();
                          },
                          child: SvgPicture.asset(
                            controller.mail == true
                                ? ImagePath.mail
                                : ImagePath.mail50,
                            height: 32.sp,
                            width: 32.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            controller.updateLocationType();
                          },
                          child: SvgPicture.asset(
                            controller.location == true
                                ? ImagePath.address
                                : ImagePath.address50,
                            height: 32.sp,
                            width: 32.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            controller.updateWebSiteType();
                          },
                          child: SvgPicture.asset(
                            controller.website == true
                                ? ImagePath.website
                                : ImagePath.website50,
                            height: 32.sp,
                            width: 32.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            controller.updateImageType();
                          },
                          child: SvgPicture.asset(
                            controller.image == true
                                ? ImagePath.logo
                                : ImagePath.logo50,
                            height: 32.sp,
                            width: 32.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.sp,
                ),

                /// EDIT  CUSTOM TABBAR
                Container(
                  height: 50.sp,
                  width: Get.width,
                  color: AppColor.offWhite,
                  padding: EdgeInsets.only(left: 20.sp),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          controller.editType.length,
                          (index) {
                            return GestureDetector(
                              onTap: () {
                                controller.updateSelectType(index);
                              },
                              child: SizedBox(
                                width: 140.sp,
                                height: 35.sp,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    controller.selectType == index
                                        ? Image.asset(
                                            ImagePath.options,
                                          )
                                        : SizedBox(),
                                    Text(
                                      '${controller.editType[index]}',
                                      style: controller.selectType == index
                                          ? FontTextStyle.kWhite18W600Poppins
                                          : FontTextStyle.kBlack18W600Poppins,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                /// FOR FRAME
                if (controller.selectType == 0)
                  Expanded(
                    child: MasonryGridView.count(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.sp, vertical: 20.sp),
                      physics: BouncingScrollPhysics(),
                      crossAxisCount: 3,
                      mainAxisSpacing: 7.sp,
                      crossAxisSpacing: 7.sp,
                      itemCount: controller.frameList.length,
                      itemBuilder: (context, frameIndex) {
                        return GestureDetector(
                          onTap: () {
                            controller.updateUpdateFrame(frameIndex);
                            controller.updateUpdateFrameAds();
                            if (controller.isShowFrameAdd == 4) {
                              showRewardAd(controller);
                              controller.updateUpdateFrame0();
                            }
                          },
                          child: Container(
                            height: 128.sp,
                            width: Get.width,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.sp),
                              color: AppColor.grey.withAlpha(100),
                              border: Border.all(
                                color: controller.selectFrame == frameIndex
                                    ? AppColor.blue
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              controller.frameList[frameIndex],
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                /// FOR GRAPHIC
                if (controller.selectType == 1)
                  Expanded(
                    child: MasonryGridView.count(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.sp, vertical: 20.sp),
                      physics: BouncingScrollPhysics(),
                      crossAxisCount: 3,
                      mainAxisSpacing: 7.sp,
                      crossAxisSpacing: 7.sp,
                      itemCount: controller.graphicList.length,
                      itemBuilder: (context, graphicIndex) {
                        return GestureDetector(
                          onTap: () {
                            controller.updateUpdateGraphic(graphicIndex);
                            controller.updateUpdateGraphicAds();
                            if (controller.isShowGraphicAdd == 4) {
                              showRewardAd(controller);

                              controller.updateUpdateGraphicAds0();
                            }
                          },
                          child: Container(
                            height: 128.sp,
                            width: Get.width,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.sp),
                              color: AppColor.grey,
                              border: Border.all(
                                color: controller.selectGraphic == graphicIndex
                                    ? AppColor.blue
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.sp),
                              child: CachedNetworkImage(
                                  height: 128.sp,
                                  width: Get.width,
                                  imageUrl:
                                      '${controller.graphicList[graphicIndex]}',
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) => Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Icon(Icons.error_outline),
                                      ),
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Center(
                                            child: CircularProgressIndicator(),
                                          )),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                /// FOR POSITION
                if (controller.selectType == 2)
                  Expanded(
                    child: MasonryGridView.count(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.sp, vertical: 20.sp),
                      physics: BouncingScrollPhysics(),
                      crossAxisCount: 3,
                      mainAxisSpacing: 7.sp,
                      crossAxisSpacing: 7.sp,
                      itemCount: controller.positionList.length,
                      itemBuilder: (context, positionIndex) {
                        return GestureDetector(
                          onTap: () {
                            controller.updateUpdatePosition(positionIndex);
                            controller.updateUpdatePositionAds();
                            if (controller.isShowPositionAdd == 4) {
                              showRewardAd(controller);

                              controller.updateUpdatePositionAds0();
                            }
                          },
                          child: Container(
                            height: 128.sp,
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.sp),
                              color: AppColor.grey,
                              border: Border.all(
                                color:
                                    controller.selectPosition == positionIndex
                                        ? AppColor.blue
                                        : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '${controller.positionList[positionIndex]}',
                              style: FontTextStyle.kBlack16W600Poppins,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                /// FOR FONT
                if (controller.selectType == 3)
                  Expanded(
                    child: MasonryGridView.count(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.sp, vertical: 20.sp),
                      physics: BouncingScrollPhysics(),
                      crossAxisCount: 3,
                      mainAxisSpacing: 7.sp,
                      crossAxisSpacing: 7.sp,
                      itemCount: controller.fonts.length,
                      itemBuilder: (context, fontIndex) {
                        return GestureDetector(
                          onTap: () {
                            controller.updateUpdateFont(fontIndex);
                            controller.updateUpdateFontAds();
                            if (controller.isShowFontAdd == 4) {
                              showRewardAd(controller);

                              controller.updateUpdateFontAds0();
                            }
                          },
                          child: Container(
                            height: 128.sp,
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.sp),
                              color: AppColor.grey,
                              border: Border.all(
                                color: controller.selectFont == fontIndex
                                    ? AppColor.blue
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '${controller.fonts[fontIndex]}',
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: FontTextStyle.kBlack16W600Poppins,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                /// FOR STOKES
                // if (controller.selectType == 3)
                //   Expanded(
                //     child: MasonryGridView.count(
                //       padding: EdgeInsets.symmetric(
                //           horizontal: 16.sp, vertical: 20.sp),
                //       physics: BouncingScrollPhysics(),
                //       crossAxisCount: 3,
                //       mainAxisSpacing: 7.sp,
                //       crossAxisSpacing: 7.sp,
                //       itemCount: 10,
                //       itemBuilder: (context, stockIndex) {
                //         return GestureDetector(
                //           onTap: () {
                //             controller.updateUpdateStock(stockIndex);
                //           },
                //           child: Container(
                //             height: 128.sp,
                //             width: Get.width,
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(8.sp),
                //               color: AppColor.grey,
                //               border: Border.all(
                //                 color: controller.selectStock == stockIndex
                //                     ? AppColor.blue
                //                     : Colors.transparent,
                //                 width: 2,
                //               ),
                //             ),
                //             alignment: Alignment.center,
                //             child: Text(
                //               'STOCK $stockIndex',
                //               style: FontTextStyle.kBlack16W600Poppins,
                //             ),
                //           ),
                //         );
                //       },
                //     ),
                //   ),
              ],
            );
          },
        ),
      ),
    );
  }

  Padding buildImage1(EditPostController controller, double height,
      double imageHeight, double imageWidth) {
    return controller.selectFrame == 0
        ? BuildFrame1(controller, height, imageHeight, imageWidth)
        : controller.selectFrame == 1
            ? BuildFrame2(controller, height, imageHeight, imageWidth)
            : controller.selectFrame == 2
                ? BuildFrame3(controller, height, imageHeight, imageWidth)
                : controller.selectFrame == 3
                    ? BuildFrame4(controller, height, imageHeight, imageWidth)
                    : controller.selectFrame == 4
                        ? BuildFrame5(
                            controller, height, imageHeight, imageWidth)
                        : controller.selectFrame == 5
                            ? BuildFrame6(
                                controller, height, imageHeight, imageWidth)
                            : controller.selectFrame == 6
                                ? BuildFrame7(
                                    controller, height, imageHeight, imageWidth)
                                : controller.selectFrame == 7
                                    ? BuildFrame8(controller, height,
                                        imageHeight, imageWidth)
                                    : controller.selectFrame == 8
                                        ? BuildFrame9(controller, height,
                                            imageHeight, imageWidth)
                                        : BuildFrame10(controller, height,
                                            imageHeight, imageWidth);
  }

  /// SHARE AND SAVE
  Future shareAndSaveImage(Uint8List bytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/flutter.svg');
    image.writeAsBytesSync(bytes);

    await Share.shareFiles([image.path]);
  }

  /// SAVE IMAGE TO GALLARY
  Future<String> saveImage(Uint8List image) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'branding_$time';
    final result = await ImageGallerySaver.saveImage(
      image,
      name: name,
    );

    return result['filePath'];
  }
}
