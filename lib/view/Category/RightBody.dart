import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:nrlifecare/controller/CategoryController/categoryController.dart';
import 'package:nrlifecare/view/SearchProduct/searchPage.dart';
import 'package:nrlifecare/view/SearchProduct/searchResultListView.dart';

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
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    categoryController.isSearchVisible.value
                        ? Container()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 20.0.w, top: 20.h),
                                child: Text(
                                  "Products",
                                  style: AppTextDecoration.heading2,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  categoryController.updateIsSearchVisible(
                                      value: true);
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(right: 20.0.w, top: 20.h),
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
                    categoryController.isSearchVisible.value
                        ? SizedBox(
                            width: 0.8.sw, height: 0.74.sh, child: SearchPage())
                        : SizedBox(
                            width: 0.8.sw,
                            height: 0.74.sh,
                            child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      elevation: 5,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 10.w,
                                            height: 150.h,
                                            decoration: const BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Obx(() => Text(
                                                        categoryController
                                                            .productList
                                                            .value[index]
                                                            .productName,
                                                        style: AppTextDecoration
                                                            .bodyText6,
                                                      )),
                                                  SizedBox(
                                                    height: 20.h,
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
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Obx(() => Text(
                                                                "₹ ${categoryController.productList.value[index].productPrice.toString()}",
                                                                style: AppTextDecoration
                                                                    .bodyText4,
                                                              )),
                                                          SizedBox(
                                                            height: 10.h,
                                                          ),
                                                          Text(
                                                            "Quantity",
                                                            style:
                                                                AppTextDecoration
                                                                    .bodyText2,
                                                          ),
                                                          SizedBox(
                                                            height: 5.h,
                                                          ),
                                                          SizedBox(
                                                            width: 80.w,
                                                            height: 30.h,
                                                            child: Center(
                                                                child:
                                                                    TextFormField(
                                                              initialValue:
                                                                  "100",
                                                              onFieldSubmitted:
                                                                  (value) {
                                                                categoryController
                                                                    .updateProductQuantity(
                                                                        index:
                                                                            index,
                                                                        quantity:
                                                                            int.parse(value));
                                                              },
                                                              decoration: InputDecoration(
                                                                  border:
                                                                      const OutlineInputBorder(),
                                                                  contentPadding:
                                                                      EdgeInsets.only(
                                                                          left:
                                                                              15.w)),
                                                            )),
                                                          ),
                                                          SizedBox(
                                                            height: 10.h,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              categoryController
                                                                  .addProductToCartToggle(
                                                                      id: categoryController
                                                                          .productList
                                                                          .value[
                                                                              index]
                                                                          .id);
                                                            },
                                                            child: Obx(
                                                              () => Container(
                                                                width: 100.w,
                                                                height: 30.h,
                                                                decoration: BoxDecoration(
                                                                    color: categoryController.productList.value[index].isAdded ==
                                                                            false
                                                                        ? AppColors
                                                                            .primaryColor
                                                                        : AppColors
                                                                            .secondaryColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5)),
                                                                child: Center(
                                                                  child: Obx(
                                                                    () => Text(
                                                                      categoryController.productList.value[index].isAdded ==
                                                                              false
                                                                          ? "Add to cart"
                                                                          : "Added",
                                                                      style: AppTextDecoration
                                                                          .bodyText2
                                                                          .copyWith(
                                                                        color: categoryController.productList.value[index].isAdded ==
                                                                                false
                                                                            ? Colors.white
                                                                            : Colors.black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Obx(() => Image.asset(
                                                            categoryController
                                                                .productList
                                                                .value[index]
                                                                .productImage,
                                                            height: 120.h,
                                                            width: 120.w,
                                                            fit: BoxFit.contain,
                                                          ))
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ));
                                },
                                itemCount: categoryController
                                    .productList.value.length),
                          ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
