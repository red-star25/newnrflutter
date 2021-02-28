import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/controller/AuthController/authcontroller.dart';
import 'package:nrlifecare/data/sharedPrefs/sharedPrefs.dart';
import 'package:nrlifecare/wigdets/CustomSnackbar/customWidgets.dart';

Widget ThirdPartyAuth(context) {
  final authController = Get.find<AuthController>();
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
          onTap: () async {
            await Get.find<AuthController>()
                .signInWithGoogle()
                .then((userCred) async {
              authController.isLoading.value = true;
              if (userCred != null ||
                  !userCred.user.isBlank ||
                  userCred.user.email != null) {
                await FirebaseFirestore.instance
                    .collection("Users")
                    .doc(userCred.user.uid)
                    .set({"uId": userCred.user.uid});
                await SharedPrefs.setIsLoggedIn(isLoggedIn: true);
                await SharedPrefs.setUid(uId: userCred.user.uid);
                await SharedPrefs.setUserName(
                    userName: userCred.user.displayName);
                await SharedPrefs.setPhotoUrl(photoUrl: userCred.user.photoURL);
                await SharedPrefs.setEmail(email: userCred.user.email);

                authController.isLoading.value = false;
                Get.toNamed("/home");
              } else {
                CustomWidgets.customAuthSnackbar(
                    message: "Something went wrong", title: "Please try again");
              }
            });
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
