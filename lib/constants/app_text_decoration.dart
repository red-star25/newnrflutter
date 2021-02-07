import 'package:flutter/material.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextDecoration {
  static final robotoFontFamily = "Roboto";

  //Heading
  static final heading1 = TextStyle(
      fontSize: 35.sp,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: robotoFontFamily);

  // Orange Body Text
  static final bodyText1 = TextStyle(
      color: AppColors.secondaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 12.sp,
      fontFamily: robotoFontFamily);

  // Navy Body Text
  static final bodyText2 = TextStyle(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.bold,
      fontFamily: robotoFontFamily,
      fontSize: 14.sp);
}
