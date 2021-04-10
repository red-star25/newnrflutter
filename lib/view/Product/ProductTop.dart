import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../wigdets/RippleLoading/RippleLoading.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nrlifecare/constants/colors.dart';
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
                icon: Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
                onPressed: () {
                  Get.back();
                }),
          ),
        ),
        Flexible(
          child: Hero(
            tag: productController.heroTag,
            child: CachedNetworkImage(
              height: 300.h,
              width: 300.h,
              imageUrl: productController.selectedProduct.productImage,
              placeholder: (_, __) => SpinKitRipple(
                color: AppColors.primaryColor,
              ),
              fit: BoxFit.contain,
              errorWidget: (context, _, __) => const Icon(
                Icons.error_outline,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
