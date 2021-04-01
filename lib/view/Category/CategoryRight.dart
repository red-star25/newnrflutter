import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:nrlifecare/controller/CategoryController/categoryController.dart';
import 'package:nrlifecare/controller/ProductController/productController.dart';
import 'package:nrlifecare/model/ProductModel/productModel.dart';
import 'package:nrlifecare/view/SearchProduct/searchPage.dart';
import 'package:nrlifecare/wigdets/ShimmerLoading/shimmerLoading.dart';
import 'package:easy_localization/easy_localization.dart';

class CategoryRightBody extends StatelessWidget {
  // final categoryController = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: CategoryController(),
      builder: (categoryController) {
        return Flexible(
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            elevation: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (categoryController.isSearchVisible.value)
                  Container()
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.0.w, top: 20.h),
                        child: Text(
                          "category_right_product",
                          style: AppTextDecoration.heading2,
                        ).tr(),
                      ),
                      InkWell(
                        onTap: () {
                          categoryController.updateIsSearchVisible(value: true);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 20.0.w, top: 20.h),
                          child: SvgPicture.asset(
                            "assets/icons/search_icon.svg",
                            width: 30.w,
                            height: 30.h,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                Divider(
                  color: AppColors.primaryColor,
                  thickness: 1,
                  endIndent: 20.w,
                  indent: 20.w,
                ),
                if (categoryController.isSearchVisible.value)
                  SizedBox(width: 0.8.sw, height: 0.74.sh, child: SearchPage())
                else
                  SizedBox(
                    width: 0.8.sw,
                    height: 0.74.sh,
                    child: StreamBuilder<List<ProductModel>>(
                        stream: categoryController.getcategoryProduct(),
                        builder: (context,
                            AsyncSnapshot<List<ProductModel>> snapshot) {
                          if (!snapshot.hasData) {
                            return CategoryRightShimmer();
                          } else {
                            return !categoryController.isAddedToCart
                                ? AnimationLimiter(
                                    child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        return AnimationConfiguration
                                            .staggeredList(
                                          position: index,
                                          duration:
                                              const Duration(milliseconds: 800),
                                          child: SlideAnimation(
                                            verticalOffset: 50.0,
                                            child: FadeInAnimation(
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Get.find<ProductController>()
                                                              .selectedProduct =
                                                          snapshot.data[index];

                                                      Get.find<
                                                              ProductController>()
                                                          .selectedIndex
                                                          .value = index;

                                                      Get.find<ProductController>()
                                                              .heroTag
                                                              .value =
                                                          "catImage$index";

                                                      Get.find<
                                                              ProductController>()
                                                          .imgBgColor
                                                          .value = AppColors
                                                              .listColor[
                                                          "l${index + 1}"];

                                                      Get.toNamed(
                                                        "/product",
                                                      );
                                                    },
                                                    child: Card(
                                                      elevation: 5,
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            width: 10.w,
                                                            height: 150.h,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: Colors.red,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    20),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 20.w,
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    snapshot
                                                                        .data[
                                                                            index]
                                                                        .productName,
                                                                    style: AppTextDecoration
                                                                        .bodyText6,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5.h,
                                                                  ),
                                                                  Text(
                                                                    snapshot
                                                                        .data[
                                                                            index]
                                                                        .physicalForm,
                                                                    style: AppTextDecoration
                                                                        .subtitle4,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                  Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          SizedBox(
                                                                            height:
                                                                                10.h,
                                                                          ),
                                                                          Text(
                                                                            "₹${double.parse(snapshot.data[index].productPrice.toString())}",
                                                                            style:
                                                                                AppTextDecoration.bodyText4,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                10.h,
                                                                          ),
                                                                          Text(
                                                                            snapshot.data[index].productSize,
                                                                            style:
                                                                                AppTextDecoration.subtitle2,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                20.h,
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              categoryController.addProductToCartToggle(id: snapshot.data[index].id);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 100.w,
                                                                              height: 30.h,
                                                                              decoration: BoxDecoration(
                                                                                color: snapshot.data[index].isAdded == false ? AppColors.primaryColor : AppColors.secondaryColor,
                                                                                borderRadius: BorderRadius.circular(5),
                                                                              ),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  snapshot.data[index].isAdded == false ? "Add to cart" : "Added",
                                                                                  style: AppTextDecoration.bodyText2.copyWith(
                                                                                    color: snapshot.data[index].isAdded == false ? Colors.white : Colors.black,
                                                                                  ),
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      Hero(
                                                                        tag:
                                                                            "catImage$index",
                                                                        child:
                                                                            Container(
                                                                          decoration: BoxDecoration(
                                                                              color: AppColors.listColor["l${index + 1}"],
                                                                              borderRadius: BorderRadius.circular(10)),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            color:
                                                                                AppColors.listColor[index],
                                                                            imageUrl:
                                                                                snapshot.data[index].productImage,
                                                                            height:
                                                                                120.h,
                                                                            width:
                                                                                120.w,
                                                                            placeholder: (_, __) =>
                                                                                SpinKitRipple(
                                                                              color: AppColors.primaryColor,
                                                                            ),
                                                                            fit:
                                                                                BoxFit.contain,
                                                                            errorWidget: (context, _, __) =>
                                                                                const Icon(
                                                                              Icons.error_outline,
                                                                              color: Colors.red,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: snapshot.data.length,
                                    ),
                                  )
                                : SpinKitRipple(
                                    color: AppColors.primaryColor,
                                  );
                          }
                        }),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
