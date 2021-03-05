import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nrlifecare/view/Cart/CartItems.dart';
import 'package:nrlifecare/view/Cart/CartTotal.dart';
import 'package:nrlifecare/wigdets/GlobalWidgets/globalHeader.dart';
import 'package:nrlifecare/wigdets/HomeWidgets/FloatingButton.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingButton(),
        body: RefreshIndicator(
          onRefresh: () {
            return Future.delayed(Duration(seconds: 1), () {
              Get.offAllNamed("/cart");
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalHeader(
                title: "cart_title",
                hasCheckoutButton: true,
                hasPadding: true,
              ),
              CartTotal(),
              Divider(
                endIndent: 10.w,
                indent: 10.w,
                color: AppColors.primaryColor,
              ),
              CartItems(),
            ],
          ),
        ),
      ),
    );
  }
}
