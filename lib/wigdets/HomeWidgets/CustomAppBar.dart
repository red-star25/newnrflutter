import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/colors.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.asset(
                  "assets/images/logo.jpeg",
                  height: 80.h,
                  width: 80.w,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "nr_name",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",
                        color: AppColors.primaryColor,
                        letterSpacing: 0.8,
                      ),
                    ).tr(),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "nr_subname",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",
                        color: AppColors.primaryColor,
                        letterSpacing: 0.8,
                      ),
                    ).tr(),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                Get.offAllNamed("/login");
                // TODO SignOut From App
              },
              icon: Icon(
                Icons.exit_to_app_rounded,
                color: AppColors.primaryColor,
                size: 30.h,
              ),
            ),
          )
        ],
      ),
    );
  }
}
