import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nrlifecare/controller/AuthController/authcontroller.dart';
import 'package:nrlifecare/wigdets/AuthWidgets/Heading.dart';
import 'package:nrlifecare/wigdets/AuthWidgets/TextField.dart';
import 'package:nrlifecare/wigdets/AuthWidgets/ThirdPartyAuth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PhoneAuth extends StatelessWidget {
  final GlobalKey<FormState> _phoneAuthKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();
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
              child: Column(
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
                                          style: AppTextDecoration.bodyText2)
                                      .tr()),
                              SizedBox(
                                height: 5.h,
                              ),
                              CustomTextField(
                                validateField: (number) =>
                                    authController.phoneNumberValidator(number),
                                controller: authController.phonenumber,
                                hintText: "989898989",
                                prefix: Text(
                                  "+91",
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                              )
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
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.transparent,
                          onPressed: () {
                            // Sign In User
                            sendOtp(context);
                          },
                          child: Text(
                            "send_otp",
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
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<bool> sendOtp(context) async {
    if (_phoneAuthKey.currentState.validate()) {
      Get.to(PhoneAuthOtp(authController.phonenumber.text));
      // print(_phoneNumberController.text);
    } else {}
    return true;
  }
}

class PhoneAuthOtp extends StatefulWidget {
  String phoneNumber;

  PhoneAuthOtp(@required this.phoneNumber);

  @override
  _PhoneAuthOtpState createState() => _PhoneAuthOtpState();
}

class _PhoneAuthOtpState extends State<PhoneAuthOtp> {
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryColor,
      key: scaffoldKey,
      body: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Column(
            children: <Widget>[
              SizedBox(height: 30.h),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Text(
                  'OTP Verification',
                  style: AppTextDecoration.heading1,
                  textAlign: TextAlign.center,
                ),
              ),
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
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.w, vertical: 18.h),
                        child: RichText(
                          text: TextSpan(
                              text: "Enter the code sent to ",
                              children: [
                                TextSpan(
                                    text: widget.phoneNumber,
                                    style: AppTextDecoration.bodyText1),
                              ],
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 15.sp)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Form(
                        key: formKey,
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 20.w),
                            child: PinCodeTextField(
                              appContext: context,
                              pastedTextStyle: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              length: 6,

                              obscuringCharacter: '*',
                              animationType: AnimationType.fade,
                              validator: (v) {
                                if (v.length < 6) {
                                  return "Invalid OTP number";
                                } else {
                                  return null;
                                }
                              },
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 40.h,
                                fieldWidth: 30.w,
                              ),
                              cursorColor: AppColors.primaryColor,
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              textStyle:
                                  TextStyle(fontSize: 16.sp, height: 1.6),

                              enableActiveFill: true,
                              errorAnimationController: errorController,
                              controller: textEditingController,
                              keyboardType: TextInputType.number,

                              onCompleted: (v) {
                                print("Completed");
                              },
                              // onTap: () {
                              //   print("Pressed");
                              // },
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  currentText = value;
                                });
                              },
                              beforeTextPaste: (text) {
                                print("Allowing to paste $text");
                                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                return true;
                              },
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text(
                          hasError
                              ? "*Please fill up all the cells properly"
                              : "",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "Didn't receive the code? ",
                            style: TextStyle(
                                color: Colors.black54, fontSize: 15.sp),
                            children: [
                              TextSpan(
                                  text: " RESEND",
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp))
                            ]),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 16.h, horizontal: 30.w),
                          child: FlatButton(
                            onPressed: () {
                              formKey.currentState.validate();
                              // conditions for validating
                              if (currentText.length != 6 ||
                                  currentText != "123456") {
                                errorController.add(ErrorAnimationType
                                    .shake); // Triggering error shake animation
                                setState(() {
                                  hasError = true;
                                });
                              } else {
                                // TODO Verified OTP
                                setState(() {
                                  hasError = false;
                                });
                                Get.back();
                              }
                            },
                            child: Center(
                                child: Text(
                              "VERIFY".toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          )),
                      SizedBox(
                        height: 16.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
