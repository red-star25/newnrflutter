import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget ThirdPartyAuth(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Expanded(
        child: InkWell(
          onTap: () {
            // TODO FB Login
          },
          child: Container(
            margin: EdgeInsets.only(left: 30.w, top: 10.h),
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.2),
                  offset: const Offset(0, 5),
                  spreadRadius: 1,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Center(
              child: SvgPicture.asset(
                "assets/images/facebook_logo.svg",
                height: 30.h,
                width: 30.w,
                color: AppColors.primaryColor,
                semanticsLabel: "facebook login",
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        width: 50.w,
      ),
      Expanded(
        child: InkWell(
          onTap: () {
            // TODO Google Login
          },
          child: Container(
            margin: EdgeInsets.only(right: 30.w, top: 10.h),
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.2),
                  offset: const Offset(0, 5),
                  spreadRadius: 1,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Center(
              child: SvgPicture.asset(
                "assets/images/google_logo.svg",
                height: 30.h,
                width: 30.w,
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: InkWell(
          onTap: () {
            Get.toNamed("/phone");
          },
          child: Container(
            margin: EdgeInsets.only(left: 30.w, top: 10.h),
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.2),
                  offset: const Offset(0, 5),
                  spreadRadius: 1,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Center(
                child: Icon(
              Icons.phone,
              color: AppColors.primaryColor,
              size: 30.h,
            )),
          ),
        ),
      ),
      SizedBox(
        width: 50.w,
      ),
    ],
  );
}
