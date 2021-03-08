import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/controller/HomeController/homeController.dart';
import 'package:nrlifecare/wigdets/GlobalWidgets/globalHeader.dart';
import 'package:nrlifecare/wigdets/HomeWidgets/FloatingButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class AboutUs extends StatelessWidget {
  final List<List> aboutUsData = [
    ["aboutus_1_title", "aboutus_1_subtitle", "assets/images/aboutus_1.png"],
    ["aboutus_2_title", "aboutus_2_subtitle", "assets/images/aboutus_2.png"],
    ["aboutus_3_title", "aboutus_3_subtitle", "assets/images/aboutus_3.png"],
    ["aboutus_4_title", "aboutus_4_subtitle", "assets/images/aboutus_4.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          Get.offAllNamed("/cart");
          Get.find<HomeController>().updateSelectedFabIcon(3);
          return Future.value(true);
        },
        child: Scaffold(
          floatingActionButton: FloatingButton(),
          body: Column(
            children: [
              GlobalHeader(title: "aboutus_title"),
              SizedBox(height: 20.h),
              Expanded(
                child: AnimationLimiter(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 40.h,
                    ),
                    itemCount: aboutUsData.length,
                    itemBuilder: (cotext, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 800),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.w, right: 10.w),
                              child: index.isOdd
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                aboutUsData[index][0]
                                                    .toString(),
                                                style:
                                                    AppTextDecoration.bodyText4,
                                              ).tr(),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Text(
                                                      aboutUsData[index][1]
                                                          .toString(),
                                                      style: AppTextDecoration
                                                          .subtitle2)
                                                  .tr(),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.w),
                                          child: Image.asset(
                                            aboutUsData[index][2].toString(),
                                            height: 120.h,
                                            width: 120.w,
                                          ),
                                        )
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 10.w),
                                          child: Image.asset(
                                            aboutUsData[index][2].toString(),
                                            height: 120.h,
                                            width: 120.w,
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                aboutUsData[index][0]
                                                    .toString(),
                                                style:
                                                    AppTextDecoration.bodyText4,
                                              ).tr(),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Text(
                                                      aboutUsData[index][1]
                                                          .toString(),
                                                      style: AppTextDecoration
                                                          .subtitle2)
                                                  .tr(),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
