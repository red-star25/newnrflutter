import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:nrlifecare/controller/AuthController/authcontroller.dart';
import 'package:nrlifecare/data/sharedPrefs/sharedPrefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyLoading extends StatefulWidget {
  @override
  _VerifyLoadingState createState() => _VerifyLoadingState();
}

class _VerifyLoadingState extends State<VerifyLoading> {
  final auth = FirebaseAuth.instance;
  User user;
  Timer timer;

  final authController = Get.find<AuthController>();

  @override
  void initState() {
    // TODO: implement initState
    verify();
    super.initState();
  }

  verify() async {
    user = auth.currentUser;
    await user.sendEmailVerification();
    timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      await checkEmailVerified();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(user.uid)
          .set({"uId": user.uid});
      await SharedPrefs.setIsLoggedIn(isLoggedIn: true);
      await SharedPrefs.setUid(uId: user.uid);
      authController.isLoading.value = false;
      Get.toNamed("/home");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 0.8.sw,
              height: 0.2.sh,
              child: Center(
                child: Text(
                  "Verify by clicking the link sent in ${Get.find<AuthController>().email.text}\n\n You will be automatically redirected when email will be verified. You can close this windows",
                  style: AppTextDecoration.bodyText4,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}
