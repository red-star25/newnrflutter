import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:nrlifecare/controller/CartController/cartController.dart';
import 'package:nrlifecare/controller/HomeController/homeController.dart';
import 'package:nrlifecare/data/sharedPrefs/sharedPrefs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final homeController = Get.find<HomeController>();
  final cartController = Get.find<CartController>();
  String userName = "";
  String photoURL = "";
  String email = "";

  @override
  void initState() {
    getUserDetails();
    cartController.getCartProducts();
    super.initState();
  }

  Future<void> getUserDetails() async {
    userName = await SharedPrefs.getUserName();
    photoURL = await SharedPrefs.getPhotoURL();
    email = await SharedPrefs.getEmail();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.shadow1,
        body: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Column(
            children: [
              if (photoURL != null)
                Padding(
                  padding: EdgeInsets.only(top: 18.0.h),
                  child: CircleAvatar(
                    radius: 80.h,
                    backgroundImage: NetworkImage(photoURL),
                  ),
                )
              else
                CircleAvatar(
                  radius: 80.h,
                  backgroundImage:
                      const AssetImage("assets/images/userImage.png"),
                ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                userName ?? "",
                style: AppTextDecoration.heading2,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                email ?? "",
                style: AppTextDecoration.bodyText4
                    .copyWith(color: AppColors.secondaryColor),
              ),
              SizedBox(
                height: 40.h,
              ),
              Expanded(
                child: SizedBox(
                  width: 1.sw,
                  child: Card(
                    elevation: 10.h,
                    shadowColor: AppColors.primaryColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  "customize_settings",
                                  style: AppTextDecoration.bodyText2,
                                ).tr(),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Card(
                                  elevation: 5,
                                  child: ListTile(
                                    onTap: () async {
                                      await Get.defaultDialog(
                                          radius: 5,
                                          barrierDismissible: true,
                                          title: "Choose preffered language",
                                          content: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15.0.w),
                                            child: Column(children: [
                                              Obx(() => Card(
                                                    color: homeController
                                                                .selectedLanguage
                                                                .toString() ==
                                                            "English"
                                                        ? AppColors.primaryColor
                                                        : Colors.white,
                                                    elevation: 5,
                                                    child: ListTile(
                                                      onTap: () async {
                                                        await homeController
                                                            .setLanguage("EN")
                                                            .then(
                                                                (value) async {
                                                          // await context
                                                          //     .setLocale(
                                                          //         const Locale(
                                                          //             "en"));
                                                          setState(() {
                                                            context.locale =
                                                                const Locale(
                                                                    "en");
                                                          });
                                                        }).then((value) =>
                                                                Get.back());
                                                      },
                                                      leading: Text(
                                                        "EN",
                                                        style: TextStyle(
                                                          color: homeController
                                                                      .selectedLanguage
                                                                      .toString() ==
                                                                  "English"
                                                              ? Colors.white
                                                              : AppColors
                                                                  .primaryColor,
                                                        ),
                                                      ),
                                                      title: Text("English",
                                                          style: TextStyle(
                                                              color: homeController
                                                                          .selectedLanguage
                                                                          .toString() ==
                                                                      "English"
                                                                  ? Colors.white
                                                                  : AppColors
                                                                      .primaryColor)),
                                                      trailing: homeController
                                                                  .selectedLanguage
                                                                  .toString() ==
                                                              "English"
                                                          ? const Icon(
                                                              Icons.check,
                                                              color:
                                                                  Colors.white)
                                                          : Icon(Icons.language,
                                                              color: AppColors
                                                                  .primaryColor),
                                                    ),
                                                  )),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Obx(() => Card(
                                                    color: homeController
                                                                .selectedLanguage
                                                                .toString() ==
                                                            "Hindi"
                                                        ? AppColors.primaryColor
                                                        : Colors.white,
                                                    elevation: 5,
                                                    child: ListTile(
                                                        onTap: () async {
                                                          await homeController
                                                              .setLanguage("HI")
                                                              .then(
                                                                  (value) async {
                                                            // await context
                                                            //     .setLocale(
                                                            //         const Locale(
                                                            //             "hi"));
                                                            setState(() {
                                                              context.locale =
                                                                  const Locale(
                                                                      "hi");
                                                            });
                                                          }).then((value) =>
                                                                  Get.back());
                                                        },
                                                        leading: Text(
                                                          "HI",
                                                          style: TextStyle(
                                                            color: homeController
                                                                        .selectedLanguage
                                                                        .toString() ==
                                                                    "Hindi"
                                                                ? Colors.white
                                                                : AppColors
                                                                    .primaryColor,
                                                          ),
                                                        ),
                                                        title: Text(
                                                          "Hindi",
                                                          style: TextStyle(
                                                              color: homeController
                                                                          .selectedLanguage
                                                                          .toString() ==
                                                                      "Hindi"
                                                                  ? Colors.white
                                                                  : AppColors
                                                                      .primaryColor),
                                                        ),
                                                        trailing: homeController
                                                                    .selectedLanguage
                                                                    .toString() ==
                                                                "Hindi"
                                                            ? const Icon(
                                                                Icons.check,
                                                                color: Colors
                                                                    .white)
                                                            : Icon(
                                                                Icons.language,
                                                                color: AppColors
                                                                    .primaryColor)),
                                                  )),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Obx(() => Card(
                                                    color: homeController
                                                                .selectedLanguage
                                                                .toString() ==
                                                            "Gujarati"
                                                        ? AppColors.primaryColor
                                                        : Colors.white,
                                                    elevation: 5,
                                                    child: ListTile(
                                                        onTap: () async {
                                                          await homeController
                                                              .setLanguage("GU")
                                                              .then(
                                                                  (value) async {
                                                            // await context
                                                            //     .setLocale(
                                                            //         const Locale(
                                                            //             "gu"));
                                                            setState(() {
                                                              context.locale =
                                                                  const Locale(
                                                                      "gu");
                                                            });
                                                          }).then((value) =>
                                                                  Get.back());
                                                        },
                                                        leading: Text(
                                                          "GU",
                                                          style: TextStyle(
                                                            color: homeController
                                                                        .selectedLanguage
                                                                        .toString() ==
                                                                    "Gujarati"
                                                                ? Colors.white
                                                                : AppColors
                                                                    .primaryColor,
                                                          ),
                                                        ),
                                                        title: Text(
                                                          "Gujarati",
                                                          style: TextStyle(
                                                              color: homeController
                                                                          .selectedLanguage
                                                                          .toString() ==
                                                                      "Gujarati"
                                                                  ? Colors.white
                                                                  : AppColors
                                                                      .primaryColor),
                                                        ),
                                                        trailing: homeController
                                                                    .selectedLanguage
                                                                    .toString() ==
                                                                "Gujarati"
                                                            ? const Icon(
                                                                Icons.check,
                                                                color: Colors
                                                                    .white)
                                                            : Icon(
                                                                Icons.language,
                                                                color: AppColors
                                                                    .primaryColor)),
                                                  )),
                                            ]),
                                          ));
                                    },
                                    subtitle: Obx(() => Text(
                                          homeController.selectedLanguage.value
                                              .toString(),
                                          style: AppTextDecoration.bodyText1,
                                        )),
                                    leading: Icon(
                                      Icons.language_outlined,
                                      color: AppColors.primaryColor,
                                    ),
                                    title: Text(
                                      "change_language",
                                      style: AppTextDecoration.bodyText3,
                                    ).tr(),
                                  ),
                                ),
                                GetBuilder<CartController>(
                                  init: CartController(),
                                  builder: (_) {
                                    return Card(
                                      elevation: 5,
                                      child: ListTile(
                                        onTap: () {
                                          Get.offAllNamed("/cart");
                                          homeController
                                              .updateSelectedFabIcon(3);
                                        },
                                        subtitle: Text(
                                          _.cartItems.length.toString(),
                                          style: AppTextDecoration.bodyText1,
                                        ),
                                        leading: Icon(
                                          Icons.shopping_bag_outlined,
                                          color: AppColors.primaryColor,
                                        ),
                                        title: Text(
                                          "your_orders",
                                          style: AppTextDecoration.bodyText3,
                                        ).tr(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            SizedBox(
                              width: 0.7.sw,
                              child: RaisedButton.icon(
                                onPressed: () async {
                                  await FirebaseAuth.instance.signOut();
                                  await SharedPrefs.setIsLoggedIn(
                                      isLoggedIn: false);
                                  final uId = await SharedPrefs.getUid();
                                  await FirebaseFirestore.instance
                                      .collection("Users")
                                      .doc(uId)
                                      .delete();
                                  await SharedPrefs.setUid();
                                  Get.offAllNamed("/login");
                                },
                                icon: const Icon(Icons.exit_to_app,
                                    color: Colors.white),
                                label: const Text(
                                  "log_out",
                                  style: TextStyle(color: Colors.white),
                                ).tr(),
                                color: AppColors.primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Center(
                                child: Text("Copyright © NR Life Care 2021.",
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontSize: 14.sp)))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
