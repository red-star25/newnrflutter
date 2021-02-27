import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nrlifecare/controller/HomeController/homeController.dart';
import 'package:nrlifecare/controller/ProductController/productController.dart';
import 'package:nrlifecare/wigdets/ShimmerLoading/shimmerLoading.dart';

class TopProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return SizedBox(
      width: 1.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: FittedBox(
              child: Text(
                "home_top_products",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                  fontFamily: "Roboto",
                ),
              ).tr(),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
              padding: EdgeInsets.only(left: 20.w),
              height: 0.36.sh,
              child: AnimationLimiter(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("TopProducts")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return TopProductShimmer();
                      } else {
                        return ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            width: 15.w,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              int.parse(snapshot.data.docs.length.toString()),
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 800),
                              child: SlideAnimation(
                                horizontalOffset: 50.0,
                                child: SlideAnimation(
                                  child: InkWell(
                                    onTap: () {
                                      Get.find<ProductController>()
                                              .selectedProduct =
                                          snapshot.data.docs[index].data()
                                              as Map<String, dynamic>;

                                      Get.find<ProductController>()
                                          .selectedIndex
                                          .value = index;

                                      Get.toNamed(
                                        "/product",
                                      );
                                    },
                                    child: Container(
                                      width: 170.w,
                                      decoration: BoxDecoration(
                                          color: AppColors
                                              .listColor["l${index + 1}"],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 14.0,
                                            left: 8,
                                            right: 8,
                                            bottom: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FittedBox(
                                                  child: Text(
                                                      snapshot
                                                          .data
                                                          .docs[index]
                                                              ["productName"]
                                                          .toString(),
                                                      style: AppTextDecoration
                                                          .bodyText4),
                                                ),
                                                SizedBox(
                                                  width: 5.h,
                                                ),
                                                FittedBox(
                                                  child: Text(
                                                    snapshot
                                                        .data
                                                        .docs[index]
                                                            ["physicalForm"]
                                                        .toString(),
                                                    style: AppTextDecoration
                                                        .subtitle1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: FittedBox(
                                                child: Text(
                                                  snapshot
                                                      .data
                                                      .docs[index]
                                                          ["productSize"]
                                                      .toString(),
                                                  style: AppTextDecoration
                                                      .bodyText1,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            SizedBox(
                                              height: 160.h,
                                              child: CachedNetworkImage(
                                                imageUrl: snapshot.data
                                                    .docs[index]["productImage"]
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
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  FittedBox(
                                                    child: Text(
                                                      "₹${double.parse(snapshot.data.docs[index]["productPrice"].toString())}",
                                                      style: AppTextDecoration
                                                          .bodyText3,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      homeController
                                                          .addProductToCartToggle(
                                                              id: snapshot
                                                                  .data
                                                                  .docs[index]
                                                                      ["id"]
                                                                  .toString());
                                                    },
                                                    child: snapshot.data
                                                                    .docs[index]
                                                                ["isAdded"] ==
                                                            false
                                                        ? SvgPicture.asset(
                                                            "assets/icons/shopping-basket.svg",
                                                            color: AppColors
                                                                .primaryColor,
                                                            width: 20.w,
                                                            height: 20.h,
                                                          )
                                                        : Text("Added",
                                                            style:
                                                                AppTextDecoration
                                                                    .subtitle2),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    }),
              ))
        ],
      ),
    );
  }
}
