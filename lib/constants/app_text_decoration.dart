import 'package:flutter/material.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: avoid_classes_with_only_static_members
class AppTextDecoration {
  static const robotoFontFamily = "Roboto";
  static final primaryColor = AppColors.primaryColor;
  //Heading
  static final heading1 = TextStyle(
    fontSize: 40.sp,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: "Roboto",
  );

  static final heading2 = TextStyle(
    color: primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 28.sp,
    fontFamily: "Roboto",
    letterSpacing: 0.5,
  );
  static final heading4 = TextStyle(
    color: primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 24.sp,
    fontFamily: "Roboto",
  );

  static final heading3 = TextStyle(
    color: primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 35.sp,
    fontFamily: "Roboto",
    letterSpacing: 0.5,
  );

  // Orange Body Text
  static final bodyText1 = TextStyle(
      color: AppColors.secondaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 12.sp,
      fontFamily: "Roboto",
      letterSpacing: 0.5);

  // Navy Body Text
  static final bodyText2 = TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.bold,
      fontFamily: "Roboto",
      fontSize: 14.sp);

  static final bodyText3 = TextStyle(
    color: primaryColor,
    fontSize: 16.sp,
    letterSpacing: 0.5,
    fontFamily: "Roboto",
    fontWeight: FontWeight.bold,
  );

  static final bodyText4 = TextStyle(
      color: primaryColor,
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      fontFamily: "Roboto",
      letterSpacing: 0.7);

  static final bodyText5 = TextStyle(
      color: AppColors.secondaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 22.sp,
      fontFamily: "Roboto",
      letterSpacing: 0.5);

  static final bodyText6 = TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 22.sp,
      fontFamily: "Roboto",
      letterSpacing: 0.5);

  static final subtitle1 = TextStyle(
      color: primaryColor,
      fontSize: 10.sp,
      letterSpacing: 0.5,
      fontFamily: "Roboto",
      fontWeight: FontWeight.bold);

  static final subtitle2 = TextStyle(
      color: AppColors.secondaryColor,
      fontSize: 14.sp,
      letterSpacing: 0.5,
      fontFamily: "Roboto",
      fontWeight: FontWeight.bold);
  static final subtitle3 = TextStyle(
      color: AppColors.secondaryColor,
      fontSize: 12.sp,
      letterSpacing: 0.5,
      fontFamily: "Roboto",
      fontWeight: FontWeight.bold);

  static final subtitle4 = TextStyle(
      color: primaryColor,
      fontSize: 16.sp,
      letterSpacing: 0.5,
      fontFamily: "Roboto",
      fontWeight: FontWeight.bold);
}
