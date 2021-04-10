import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../RippleLoading/rippleLoading.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nrlifecare/controller/HomeController/homeController.dart';
import 'package:nrlifecare/controller/ProductController/productController.dart';
import 'package:nrlifecare/model/ProductModel/productModel.dart';
import 'package:nrlifecare/wigdets/ShimmerLoading/shimmerLoading.dart';

class NewIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Card(
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Container(
        width: 1.sw,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: FittedBox(
                child: Text(
                  "home_newin",
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
              height: 5.h,
            ),
            Flexible(
              child: SizedBox(
                height: 1.sh,
                child: StreamBuilder<List<ProductModel>>(
                    stream: homeController.getProducts("NewProducts"),
                    builder:
                        (context, AsyncSnapshot<List<ProductModel>> snapshot) {
                      if (!snapshot.hasData) {
                        return NewInShimmer();
                      } else {
                        return AnimationLimiter(
                          child: ListView.builder(
                            // scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 800),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8.0.w, horizontal: 20.w),
                                      child: InkWell(
                                        onTap: () {
                                          Get.find<ProductController>()
                                                  .selectedProduct =
                                              snapshot.data[index];

                                          Get.find<ProductController>()
                                              .selectedIndex
                                              .value = index;

                                          Get.find<ProductController>()
                                              .heroTag
                                              .value = "newProduct$index";

                                          Get.find<ProductController>()
                                                  .imgBgColor
                                                  .value =
                                              AppColors
                                                  .listColor["l${index + 1}"];

                                          Get.toNamed(
                                            "/product",
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 100.h,
                                                  width: 100.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: AppColors.listColor[
                                                        "l${index + 1}"],
                                                  ),
                                                  child: Hero(
                                                    tag: "newProduct$index",
                                                    child: CachedNetworkImage(
                                                      imageUrl: snapshot
                                                          .data[index]
                                                          .productImage
                                                          .toString(),
                                                      placeholder: (_, __) =>
                                                          SpinKitRipple(
                                                        color: AppColors
                                                            .primaryColor,
                                                      ),
                                                      fit: BoxFit.contain,
                                                      errorWidget:
                                                          (context, _, __) =>
                                                              const Icon(
                                                        Icons.error_outline,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.h,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      FittedBox(
                                                          child: Text(
                                                              snapshot
                                                                  .data[index]
                                                                  .productName,
                                                              style: AppTextDecoration
                                                                  .bodyText4)),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      FittedBox(
                                                        child: Text(
                                                          snapshot.data[index]
                                                              .productSize,
                                                          style:
                                                              AppTextDecoration
                                                                  .bodyText1
                                                                  .copyWith(
                                                                      fontSize:
                                                                          14.sp),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 20.0.w),
                                                  child: FittedBox(
                                                    child: Text(
                                                      "₹${double.parse(snapshot.data[index].productPrice.toString())}/-",
                                                      style: AppTextDecoration
                                                          .bodyText2
                                                          .copyWith(
                                                              fontSize: 14.sp),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    homeController
                                                        .addNewInProductToCart(
                                                            id: snapshot
                                                                .data[index]
                                                                .id);
                                                  },
                                                  child: snapshot.data[index]
                                                              .isAdded ==
                                                          false
                                                      ? SvgPicture.asset(
                                                          "assets/icons/shopping-basket.svg",
                                                          color: AppColors
                                                              .primaryColor,
                                                          width: 25.w,
                                                          height: 25.h,
                                                        )
                                                      : Row(
                                                          children: [
                                                            Icon(
                                                              Icons.check,
                                                              color: AppColors
                                                                  .secondaryColor,
                                                              size: 20.h,
                                                            ),
                                                            Text("Added",
                                                                style: AppTextDecoration
                                                                    .subtitle2),
                                                          ],
                                                        ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: snapshot.data.length,
                          ),
                        );
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
