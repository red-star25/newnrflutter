import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/controller/ProductController/productController.dart';

class ProductTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  Get.back();
                }),
          ),
        ),
        Flexible(
          child: Obx(() => Image.asset(
                productController.selectedProduct.value.productImage,
                width: 300.w,
                height: 300.h,
                fit: BoxFit.contain,
              )),
        ),
      ],
    );
  }
}
