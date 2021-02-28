import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nrlifecare/controller/CategoryController/categoryController.dart';
import 'package:nrlifecare/controller/HomeController/homeController.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../ShimmerLoading/shimmerLoading.dart';

class Categories extends StatelessWidget {
  final categoryController = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                child: Text(
                  "home_categories",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                    fontFamily: "Roboto",
                  ),
                ).tr(),
              ),
              InkWell(
                onTap: () async {
                  Get.find<HomeController>().selectedFabIcon.value = 2;
                  await FirebaseFirestore.instance
                      .collection("Categories")
                      .get()
                      .then((value) {
                    categoryController.setCategoryId(value
                        .docs[categoryController.selectedCategoryIndex.value].id
                        .toString());
                  });
                  Get.toNamed("/category");
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: FittedBox(
                      child: Text(
                        "home_see_all",
                        style: AppTextDecoration.bodyText1,
                      ).tr(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 0.16.sh,
            width: 1.sw,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Categories")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CategoriesShimmer();
                  } else {
                    return AnimationLimiter(
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 800),
                            child: SlideAnimation(
                              horizontalOffset: 50.0,
                              child: FadeInAnimation(
                                child: InkWell(
                                  onTap: () {
                                    categoryController
                                        .setSelectedCategory(index);
                                    categoryController.setCategoryId(snapshot
                                        .data.docs[index]["id"]
                                        .toString());
                                    Get.find<HomeController>()
                                        .selectedFabIcon
                                        .value = 2;
                                    Get.toNamed("/category");
                                  },
                                  child: SizedBox(
                                    width: 105.w,
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            color: AppColors.listColor[
                                                "l${20 - (index + 1)}"],
                                            width: 105.w,
                                            height: 100.h,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: CachedNetworkImage(
                                                imageUrl: snapshot
                                                    .data
                                                    .docs[index]
                                                        ["categoryImage"]
                                                    .toString(),
                                                placeholder: (_, __) =>
                                                    SpinKitRipple(
                                                  color: AppColors.primaryColor,
                                                ),
                                                fit: BoxFit.contain,
                                                errorWidget: (context, _, __) =>
                                                    const Icon(
                                                  Icons.error_outline,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Text(
                                          snapshot
                                              .data.docs[index]["categoryName"]
                                              .toString(),
                                          style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.7),
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          width: 10.w,
                        ),
                        itemCount: int.parse(
                          snapshot.data.docs.length.toString(),
                        ),
                      ),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
