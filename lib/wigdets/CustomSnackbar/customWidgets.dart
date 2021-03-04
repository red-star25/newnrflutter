import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomWidgets {
  static dynamic customSnackBar1() {
    return Get.snackbar(
      "",
      "",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primaryColor,
      duration: const Duration(milliseconds: 2000),
      icon: Padding(
        padding: EdgeInsets.only(left: 15.0.w),
        child: Text(
          "❌",
          style: TextStyle(fontSize: 16.h),
        ),
      ),
      isDismissible: true,
      messageText: Text(
        "You can't add quantity less than 1",
        style: AppTextDecoration.subtitle2.copyWith(color: Colors.white),
      ),
      titleText: Text(
        "Enter valid quantity",
        style: AppTextDecoration.subtitle2.copyWith(color: Colors.white),
      ),
    );
  }

  static dynamic customAuthSnackbar({String message, String title}) {
    return Get.snackbar(
      "",
      "",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primaryColor,
      duration: const Duration(milliseconds: 2000),
      icon: Padding(
        padding: EdgeInsets.only(left: 15.0.w),
        child: Text(
          "❌",
          style: TextStyle(fontSize: 16.h),
        ),
      ),
      isDismissible: true,
      messageText: Text(
        message,
        style: AppTextDecoration.subtitle2.copyWith(color: Colors.white),
      ),
      titleText: Text(
        title,
        style: AppTextDecoration.subtitle2.copyWith(color: Colors.white),
      ),
    );
  }

  static dynamic customDialogRegister() {
    return Get.dialog(
      SizedBox(
        width: 0.8.sw,
        height: 0.3.sh,
        child: Center(
          child: Text(
            "Please check your inbox and verify your email address",
            style: AppTextDecoration.bodyText3,
          ),
        ),
      ),
      barrierDismissible: false,
      useSafeArea: true,
    );
  }

  static dynamic customPaymentSnackbar(
      {String message, String title, String utfLogo}) {
    return Get.snackbar(
      "",
      "",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primaryColor,
      duration: const Duration(milliseconds: 2000),
      icon: Padding(
        padding: EdgeInsets.only(left: 15.0.w),
        child: Text(
          utfLogo,
          style: TextStyle(fontSize: 16.h),
        ),
      ),
      isDismissible: true,
      messageText: Text(
        message,
        style: AppTextDecoration.subtitle2.copyWith(color: Colors.white),
      ),
      titleText: Text(
        title,
        style: AppTextDecoration.subtitle2.copyWith(color: Colors.white),
      ),
    );
  }
}
