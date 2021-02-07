import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PhoneAuth extends StatelessWidget {
  final GlobalKey<FormState> _phoneAuthKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();
  final _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 60.h),
                child: Center(
                    child: FittedBox(
                  child: Text(
                    "phone_text",
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 20.h),
                      thirdPartyLogin(context),
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
                              Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 4.h,
                                      bottom: 4.h,
                                      right: 4.w,
                                      left: 15.w),
                                  child: TextFormField(
                                    validator: (number) {
                                      if (number.isEmpty) {
                                        return "Please enter a valid phone number";
                                      }
                                      if (number.length < 10 ||
                                          number.length > 10) {
                                        return "Number should be 10 digit long";
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      _phoneNumberController.text = value;
                                    },
                                    controller: _phoneNumberController,
                                    decoration: InputDecoration(
                                        prefix: Text(
                                          "+91",
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontFamily: "Roboto",
                                          ),
                                        ),
                                        hintText: "9898989898",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16.sp,
                                        ),
                                        border: InputBorder.none,
                                        fillColor: AppColors.primaryColor),
                                  ),
                                ),
                              ),
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
                              Color(0xff957CEB),
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
      Get.to(PhoneAuthOtp(_phoneNumberController.text));
      // print(_phoneNumberController.text);
    } else {
      Get.snackbar(
        "",
        "",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.primaryColor,
        colorText: Colors.white,
        isDismissible: true,
        messageText: Text(
          "Something went wrong",
          style: AppTextDecoration.bodyText1,
        ),
        titleText: Text(
          "Oops!! 😥",
          style: AppTextDecoration.bodyText2
              .copyWith(color: Colors.white, fontSize: 16.sp),
        ),
      );
    }
    return true;
  }

  Widget thirdPartyLogin(context) {
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
                    offset: Offset(0, 5),
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
                    offset: Offset(0, 5),
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
                    offset: Offset(0, 5),
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
}

class PhoneAuthOtp extends StatefulWidget {
  final String phoneNumber;

  PhoneAuthOtp(this.phoneNumber);

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
        child: Container(
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
                  decoration: BoxDecoration(
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
                              obscureText: false,
                              obscuringCharacter: '*',
                              animationType: AnimationType.fade,
                              validator: (v) {
                                if (v.length < 3) {
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
                                activeFillColor:
                                    hasError ? Colors.white : Colors.white,
                              ),
                              cursorColor: AppColors.primaryColor,
                              animationDuration: Duration(milliseconds: 300),
                              textStyle:
                                  TextStyle(fontSize: 16.sp, height: 1.6),
                              backgroundColor: Colors.white,
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
                      SizedBox(
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
