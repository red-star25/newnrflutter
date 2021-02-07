import 'package:flutter/material.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget Heading() {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(top: 60.h),
        child: Center(
            child: FittedBox(
          child: Text(
            "signup_text",
            style: AppTextDecoration.heading1,
          ).tr(),
        )),
      ),
      Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: FittedBox(
            child: Text(
              "access_account",
              style: AppTextDecoration.bodyText1,
            ).tr(),
          ))
    ],
  );
}