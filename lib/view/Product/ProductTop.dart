import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/controller/HomeController/homeController.dart';
import 'package:nrlifecare/controller/ProductController/productController.dart';

class ProductTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        init: ProductController(),
        builder: (productController) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white),
                        onPressed: () {
                          Get.back();
                        }),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Obx(
                        () => InkWell(
                          onTap: () {
                            Get.find<HomeController>().addProductToCart(
                                Get.find<HomeController>()
                                    .topProducts
                                    .value[productController.selectedIndex],
                                productController.selectedIndex);
                          },
                          child: Get
                                      .arguments["productList"]
                                          [productController.selectedIndex]
                                      .isAdded ==
                                  false
                              ? SvgPicture.asset(
                                  "assets/icons/shopping-basket.svg",
                                  color: Colors.white,
                                  width: 25.w,
                                  height: 25.h,
                                )
                              : Row(
                                  children: [
                                    Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 20.h,
                                    ),
                                    Text("Added",
                                        style: AppTextDecoration.subtitle2
                                            .copyWith(color: Colors.white)),
                                  ],
                                ),
                        ),
                      )),
                ],
              ),
              Image.asset(
                productController.selectedProduct.productImage,
                width: 300.w,
                height: 300.h,
                fit: BoxFit.contain,
              ),
            ],
          );
        });
  }
}
