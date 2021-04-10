import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../wigdets/RippleLoading/RippleLoading.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:nrlifecare/controller/AuthController/authcontroller.dart';
import 'package:nrlifecare/wigdets/AuthWidgets/Heading.dart';
import 'package:nrlifecare/wigdets/AuthWidgets/ThirdPartyAuth.dart';

import '../../wigdets/AuthWidgets/AuthButton.dart';
import '../../wigdets/AuthWidgets/TextField.dart';

class Login extends StatelessWidget {
  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: authController.isResizeToAvoidBottom.value,
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: SizedBox(
            height: 1.sh,
            width: 1.sw,
            child: Column(
              children: [
                const Heading(
                  headingText: "signin_text",
                ),
                SizedBox(
                  height: 40.h,
                ),
                Obx(
                  () => Flexible(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: !authController.isLoading.value
                          ? AnimationLimiter(
                              child: Column(
                                children:
                                    AnimationConfiguration.toStaggeredList(
                                  duration: const Duration(milliseconds: 375),
                                  childAnimationBuilder: (widget) =>
                                      SlideAnimation(
                                    horizontalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: widget,
                                    ),
                                  ),
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
                                      key: _signInFormKey,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 25.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FittedBox(
                                                    child: Text("email_text",
                                                            style:
                                                                AppTextDecoration
                                                                    .bodyText2)
                                                        .tr()),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                CustomTextField(
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  validateField: (email) =>
                                                      authController
                                                          .emailValidate(email),
                                                  controller:
                                                      authController.email,
                                                  hintText: "a@email.com",
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 25.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FittedBox(
                                                    child: Text("password_text",
                                                            style:
                                                                AppTextDecoration
                                                                    .bodyText2)
                                                        .tr()),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                CustomTextField(
                                                  controller:
                                                      authController.password,
                                                  validateField: (password) =>
                                                      authController
                                                          .passwordValidate(
                                                              password),
                                                  hintText: "******",
                                                  isObsecure: true,
                                                )
                                              ],
                                            ),
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                              colors: [
                                                AppColors.primaryColor,
                                                AppColors.btnColor1,
                                              ],
                                            ),
                                          ),
                                          child: !authController.isLoading.value
                                              ? AuthButton(
                                                  btnText: "signin_text",
                                                  verify: () async {
                                                    await authController
                                                        .loginUser(
                                                            _signInFormKey);
                                                  },
                                                )
                                              : SpinKitRipple(
                                                  color: AppColors.primaryColor,
                                                ),
                                        ),
                                        SizedBox(height: 15.h),
                                        InkWell(
                                          onTap: () {
                                            authController.clearTextField();
                                            authController.isResizeToAvoidBottom
                                                .value = true;
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
                          : SpinKitRipple(
                              color: AppColors.primaryColor,
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
