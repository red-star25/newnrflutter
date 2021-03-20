import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:nrlifecare/data/sharedPrefs/sharedPrefs.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, bottom: 8.h),
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
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        Get.toNamed("/userProfile");
                      },
                      icon: Icon(
                        Icons.person_outline_outlined,
                        color: AppColors.primaryColor,
                        size: 30.h,
                      ),
                    ),
                    Flexible(
                      child: IconButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          await SharedPrefs.setIsLoggedIn(isLoggedIn: false);
                          final uId = await SharedPrefs.getUid();
                          await FirebaseFirestore.instance
                              .collection("Users")
                              .doc(uId)
                              .delete();
                          await SharedPrefs.setUid();
                          Get.offAllNamed("/login");
                        },
                        icon: Icon(
                          Icons.exit_to_app_rounded,
                          color: AppColors.primaryColor,
                          size: 30.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
