import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nrlifecare/controller/AuthController/authcontroller.dart';
import 'package:nrlifecare/data/sharedPrefs/sharedPrefs.dart';
import 'package:nrlifecare/wigdets/AuthWidgets/Heading.dart';
import 'package:nrlifecare/wigdets/AuthWidgets/TextField.dart';
import 'package:nrlifecare/wigdets/AuthWidgets/ThirdPartyAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuth extends StatefulWidget {
  @override
  _PhoneAuthState createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  final GlobalKey<FormState> _phoneAuthKey = GlobalKey<FormState>();

  final authController = Get.find<AuthController>();

  String verificationId, smsCode;

  AuthCredential _phoneAuthCredential;

  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  bool codeSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Heading(headingText: "phone_text"),
          SizedBox(
            height: 40.h,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: !authController.isLoading.value
                  ? Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 20.h),
                            ThirdPartyAuth(context),
                            SizedBox(
                              height: 25.h,
                            ),
                            FittedBox(
                                child: Text(
                              "signin_option_text",
                              style: AppTextDecoration.bodyText2,
                            ).tr()),
                          ],
                        ),
                        SizedBox(height: 0.05.sh),
                        Form(
                          key: _phoneAuthKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                        child: Text("phone_number",
                                                style:
                                                    AppTextDecoration.bodyText2)
                                            .tr()),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    CustomTextField(
                                      textInputType: TextInputType.number,
                                      validateField: (number) {
                                        authController
                                            .phoneNumberValidator(number);
                                      },
                                      controller: _phoneNumberController,
                                      hintText: "9898989898",
                                      prefix: Text("+91",
                                          style: AppTextDecoration.bodyText3),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    codeSent
                                        ? CustomTextField(
                                            validateField: (otp) {
                                              authController.otpValidator(otp);
                                            },
                                            controller: _otpController,
                                            hintText: "Enter 6 digit OTP",
                                          )
                                        : Container()
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 0.1.sh,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 0.8.sw,
                              height: 0.08.sh,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.primaryColor,
                                    AppColors.btnColor1,
                                  ],
                                ),
                              ),
                              child: !codeSent
                                  ? RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color: Colors.transparent,
                                      onPressed: () {
                                        // Sign In User
                                        codeSent
                                            ? signInWithOTP(
                                                smsCode, verificationId)
                                            : verifyPhone(
                                                _phoneNumberController.text);
                                      },
                                      child: Text(
                                        "send_otp",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ).tr())
                                  : RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color: Colors.transparent,
                                      onPressed: () async {
                                        String smsCode = _otpController.text
                                            .toString()
                                            .trim();

                                        _phoneAuthCredential =
                                            PhoneAuthProvider.credential(
                                                verificationId: verificationId,
                                                smsCode: smsCode);

                                        _login();
                                      },
                                      child: Text(
                                        "Verify",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ).tr(),
                                    ),
                            ),
                            SizedBox(height: 15.h),
                            InkWell(
                              onTap: () {
                                //TODO Navigate to Register Screen
                                Get.toNamed("/register");
                              },
                              child: FittedBox(
                                  child: Text(
                                "goto_register_text",
                                style: AppTextDecoration.bodyText2,
                              ).tr()),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Center(
                      child: SpinKitRipple(
                        color: AppColors.primaryColor,
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }

  _login() async {
    try {
      authController.isLoading.value = true;
      await FirebaseAuth.instance
          .signInWithCredential(_phoneAuthCredential)
          .then((authRes) async {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(authRes.user.uid)
            .set({"uId": authRes.user.uid});
        await SharedPrefs.setIsLoggedIn(isLoggedIn: true);
        await SharedPrefs.setUid(uId: authRes.user.uid);
        authController.isLoading.value = false;
        Get.offAllNamed("/home");
      });
    } catch (e) {
      authController.isLoading.value = false;
      print(e);
    }
  }

  void signInWithOTP(String smsCode, String verId) {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> verifyPhone(phoneNo) async {
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      setState(() {
        _phoneAuthCredential = phoneAuthCredential;
      });
      _login();
    };

    final PhoneVerificationFailed verificationfailed =
        (Exception authException) {
      print('$authException');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      setState(() {
        verificationId = verId;
        codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      setState(() {
        verificationId = verId;
      });
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91$phoneNo",
        timeout: const Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}
