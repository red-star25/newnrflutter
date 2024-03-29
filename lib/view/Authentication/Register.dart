import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:nrlifecare/controller/AuthController/authcontroller.dart';
import 'package:nrlifecare/wigdets/AuthWidgets/Heading.dart';
import 'package:nrlifecare/wigdets/AuthWidgets/ThirdPartyAuth.dart';

import '../../wigdets/AuthWidgets/AuthButton.dart';
import '../../wigdets/AuthWidgets/TextField.dart';

class Register extends StatelessWidget {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: SizedBox(
            height: 1.sh,
            width: 1.sw,
            child: Column(children: [
              const Heading(
                headingText: "signup_text",
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
                  child: SingleChildScrollView(
                    child: AnimationLimiter(
                      child: Column(
                        children: AnimationConfiguration.toStaggeredList(
                          duration: const Duration(milliseconds: 375),
                          childAnimationBuilder: (widget) => SlideAnimation(
                            horizontalOffset: 50.0,
                            child: FadeInAnimation(
                              child: widget,
                            ),
                          ),
                          children: [
                            SizedBox(height: 20.h),
                            ThirdPartyAuth(context),
                            SizedBox(
                              height: 25.h,
                            ),
                            FittedBox(
                                child: Text(
                              "signup_option_text",
                              style: AppTextDecoration.bodyText2,
                            ).tr()),
                            SizedBox(height: 0.03.sh),
                            Form(
                              key: _signUpFormKey,
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
                                                    style: AppTextDecoration
                                                        .bodyText2)
                                                .tr()),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        CustomTextField(
                                          textInputAction:
                                              TextInputAction.next,
                                          validateField: (email) =>
                                              authController
                                                  .emailValidate(email),
                                          controller: authController.email,
                                          hintText: "a@email.com",
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
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
                                                    style: AppTextDecoration
                                                        .bodyText2)
                                                .tr()),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        CustomTextField(
                                          textInputAction:
                                              TextInputAction.next,
                                          controller: authController.password,
                                          validateField: (password) =>
                                              authController
                                                  .passwordValidate(password),
                                          hintText: "******",
                                          isObsecure: true,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 25.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FittedBox(
                                            child: Text("confirm_password",
                                                    style: AppTextDecoration
                                                        .bodyText2)
                                                .tr()),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        CustomTextField(
                                          controller:
                                              authController.confirmpassword,
                                          validateField: (confirmPassword) =>
                                              authController
                                                  .confirmPasswordValidate(
                                            confirmPassword,
                                          ),
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
                              height: 0.05.sh,
                            ),
                            AuthButton(
                                btnText: "signup_text",
                                verify: () async {
                                  await authController
                                      .registerUser(_signUpFormKey);
                                  // authController.navigateToHome();
                                }),
                            SizedBox(height: 15.h),
                            InkWell(
                              onTap: () {
                                authController.clearTextField();
                                Get.offNamed("/login");
                              },
                              child: FittedBox(
                                  child: Text(
                                "goto_login_text",
                                style: AppTextDecoration.bodyText2,
                              ).tr()),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
