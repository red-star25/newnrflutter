import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nrlifecare/controller/HomeController/homeController.dart';
import 'package:nrlifecare/controller/ProductController/productController.dart';

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
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: 15.w,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.find<ProductController>().selectedProduct.value =
                          homeController.topProducts.value[index];

                      Get.find<ProductController>().selectedIndex.value = index;

                      Get.toNamed(
                        "/product",
                        arguments: {
                          "productList": homeController.topProducts.value
                        },
                      );
                    },
                    child: Container(
                      width: 170.w,
                      decoration: BoxDecoration(
                          color: AppColors.listColor["l${index + 1}"],
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 14.0, left: 8, right: 8, bottom: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Obx(
                                  () => FittedBox(
                                    child: Text(
                                        homeController.topProducts.value[index]
                                            .productName,
                                        style: AppTextDecoration.bodyText4),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.h,
                                ),
                                FittedBox(
                                  child: Obx(
                                    () => Text(
                                      homeController
                                          .topProducts.value[index].productType,
                                      style: AppTextDecoration.subtitle1,
                                    ),
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
                                child: Obx(
                                  () => Text(
                                    homeController
                                        .topProducts.value[index].productSize,
                                    style: AppTextDecoration.bodyText1,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Obx(
                              () => Image.asset(
                                homeController
                                    .topProducts.value[index].productImage,
                                height: 160.h,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FittedBox(
                                    child: Obx(() => Text(
                                          "₹${homeController.topProducts.value[index].productPrice.toString()}",
                                          style: AppTextDecoration.bodyText3,
                                        )),
                                  ),
                                  Obx(() => InkWell(
                                        onTap: () {
                                          homeController.addProductToCartToggle(
                                              id: Get.find<HomeController>()
                                                  .topProducts
                                                  .value[index]
                                                  .id);
                                        },
                                        child: !homeController.topProducts
                                                .value[index].isAdded
                                            ? SvgPicture.asset(
                                                "assets/icons/shopping-basket.svg",
                                                color: AppColors.primaryColor,
                                                width: 20.w,
                                                height: 20.h,
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
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }
}
