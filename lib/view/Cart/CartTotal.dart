import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nrlifecare/controller/CartController/cartController.dart';

class CartTotal extends StatefulWidget {
  @override
  _CartTotalState createState() => _CartTotalState();
}

class _CartTotalState extends State<CartTotal> {
  final cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    cartController.totalCartProductPrice();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (cartController) => SizedBox(
        height: 80.h,
        width: 1.sw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "cart_total",
              style: AppTextDecoration.bodyText5
                  .copyWith(color: AppColors.primaryColor),
            ).tr(),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "₹ ${cartController.totalCartProductPrice().toString()} /-",
              style: AppTextDecoration.bodyText5
                  .copyWith(color: AppColors.primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
