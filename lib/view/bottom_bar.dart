import 'dart:io';

import 'package:branding/constant/color.dart';
import 'package:branding/controller/bottom_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomBarScreen extends StatelessWidget {
  final int pageIndex;
  BottomBarScreen({Key? key, required this.pageIndex}) : super(key: key);
  BottomBarController bottomBarController = Get.put(BottomBarController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bottomBarController.updateBottomIndex(0);
        return await showExitPopup(context);
      },
      child: Scaffold(
        bottomNavigationBar: GetBuilder<BottomBarController>(
          builder: (controller) {
            return Container(
              height: 80.sp,
              width: Get.width,
              color: AppColor.blackFull,
              padding: EdgeInsets.symmetric(horizontal: 22.sp),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                        controller.menu.length,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              controller.updateBottomIndex(
                                  pageIndex.isBlank == true
                                      ? pageIndex
                                      : index);
                            },
                            child: controller.selectBottomBar == index
                                ? SvgPicture.asset(
                                    controller.menu[pageIndex.isBlank == true
                                        ? pageIndex
                                        : index],
                                    height: 32.sp,
                                    width: 32.sp,
                                    color: Colors.transparent,
                                  )
                                : SvgPicture.asset(
                                    controller.menu[pageIndex.isBlank == true
                                        ? pageIndex
                                        : index],
                                    height: 32.sp,
                                    width: 32.sp,
                                  ),
                          );
                        },
                      )
                    ],
                  ),
                  Container(
                    height: 80.sp,
                    width: Get.width,
                    color: Colors.black45,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                        controller.menu.length,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              controller.updateBottomIndex(
                                  pageIndex.isBlank == true
                                      ? pageIndex
                                      : index);
                            },
                            child: controller.selectBottomBar == index
                                ? SvgPicture.asset(
                                    controller.menu[pageIndex.isBlank == true
                                        ? pageIndex
                                        : index],
                                    height: 40.sp,
                                    width: 40.sp,
                                  )
                                : SvgPicture.asset(
                                    controller.menu[pageIndex.isBlank == true
                                        ? pageIndex
                                        : index],
                                    height: 40.sp,
                                    width: 40.sp,
                                    color: Colors.transparent,
                                  ),
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        body: GetBuilder<BottomBarController>(
          builder: (bottomController) {
            return bottomController.appScreen[bottomController.selectBottomBar];
          },
        ),
      ),
    );
  }
}

Future<bool> showExitPopup(context) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          height: 100.sp,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Do you want to exit?"),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        exit(0);
                      },
                      child: Text("Yes"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.blue),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        print('no selected');
                        Navigator.of(context).pop();
                      },
                      child: Text("No", style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
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
}
