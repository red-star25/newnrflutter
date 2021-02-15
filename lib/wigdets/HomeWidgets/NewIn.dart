import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nrlifecare/controller/HomeController/homeController.dart';
import 'package:nrlifecare/controller/ProductController/productController.dart';

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
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
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
              height: 10.h,
            ),
            Flexible(
              child: SizedBox(
                height: 1.sh,
                child: ListView.builder(
                  // scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 8.0.w, horizontal: 20.w),
                      child: InkWell(
                        onTap: () {
                          Get.find<ProductController>().selectedProduct.value =
                              homeController.newInProducts.value[index];

                          Get.find<ProductController>().selectedIndex.value =
                              index;

                          Get.toNamed(
                            "/product",
                            arguments: {
                              "productList": homeController.newInProducts.value
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 100.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.listColor["l${index + 1}"],
                                  ),
                                  child: Obx(
                                    () => Image.asset(
                                      homeController.newInProducts.value[index]
                                          .productImage,
                                      height: 160.h,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FittedBox(
                                        child: Obx(() => Text(
                                            homeController.newInProducts
                                                .value[index].productName,
                                            style:
                                                AppTextDecoration.bodyText4)),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      FittedBox(
                                        child: Obx(
                                          () => Text(
                                            "${homeController.newInProducts.value[index].productSize}",
                                            style: AppTextDecoration.bodyText1
                                                .copyWith(fontSize: 14.sp),
                                          ),
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
                                  padding: EdgeInsets.only(right: 20.0.w),
                                  child: FittedBox(
                                    child: Obx(
                                      () => Text(
                                        "₹${homeController.newInProducts.value[index].productPrice}/-",
                                        style: AppTextDecoration.bodyText2
                                            .copyWith(fontSize: 14.sp),
                                      ),
                                    ),
                                  ),
                                ),
                                Obx(() => InkWell(
                                      onTap: () {
                                        homeController.addNewInProductToCart(
                                            id: Get.find<HomeController>()
                                                .newInProducts
                                                .value[index]
                                                .id);
                                      },
                                      child: !homeController.newInProducts
                                              .value[index].isAdded
                                          ? SvgPicture.asset(
                                              "assets/icons/shopping-basket.svg",
                                              color: AppColors.primaryColor,
                                              width: 25.w,
                                              height: 25.h,
                                            )
                                          : Row(
                                              children: [
                                                Icon(
                                                  Icons.check,
                                                  color:
                                                      AppColors.secondaryColor,
                                                  size: 20.h,
                                                ),
                                                Text("Added",
                                                    style: AppTextDecoration
                                                        .subtitle2),
                                              ],
                                            ),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: homeController.newInProducts.value.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
