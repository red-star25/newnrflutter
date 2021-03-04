import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
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
  String userName = "";
  String photoURL = "";
  String email = "";

  @override
  void initState() {
    getUserDetails();
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
              InkWell(
                onTap: () {
                  Get.offNamed("/home");
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    top: 10.h,
                  ),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.primaryColor,
                        size: 30.h,
                      )),
                ),
              ),
              CircleAvatar(
                radius: 80.h,
                backgroundImage:
                    photoURL != null ? NetworkImage(photoURL) : null,
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
                                    onTap: () {
                                      Get.defaultDialog(
                                          radius: 5,
                                          barrierDismissible: true,
                                          title: "Choose preffered language",
                                          content: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15.0.w),
                                            child: Column(children: [
                                              Obx(() => Card(
                                                    color: homeController
                                                                    .languageSettings[
                                                                "EN"] ==
                                                            true
                                                        ? AppColors.primaryColor
                                                        : Colors.white,
                                                    elevation: 5,
                                                    child: ListTile(
                                                      onTap: () {
                                                        homeController
                                                            .setLanguage("EN");
                                                        setState(() {
                                                          context.locale =
                                                              const Locale(
                                                                  "en");
                                                        });
                                                      },
                                                      leading: Text(
                                                        "EN",
                                                        style: TextStyle(
                                                          color: homeController
                                                                          .languageSettings[
                                                                      "EN"] ==
                                                                  true
                                                              ? Colors.white
                                                              : AppColors
                                                                  .primaryColor,
                                                        ),
                                                      ),
                                                      title: Text("English",
                                                          style: TextStyle(
                                                              color: homeController
                                                                              .languageSettings[
                                                                          "EN"] ==
                                                                      true
                                                                  ? Colors.white
                                                                  : AppColors
                                                                      .primaryColor)),
                                                      trailing: homeController
                                                                      .languageSettings[
                                                                  "EN"] ==
                                                              true
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
                                                                    .languageSettings[
                                                                "HI"] ==
                                                            true
                                                        ? AppColors.primaryColor
                                                        : Colors.white,
                                                    elevation: 5,
                                                    child: ListTile(
                                                        onTap: () {
                                                          homeController
                                                              .setLanguage(
                                                                  "HI");
                                                          setState(() {
                                                            context.locale =
                                                                const Locale(
                                                                    "hi");
                                                          });
                                                        },
                                                        leading: Text(
                                                          "HI",
                                                          style: TextStyle(
                                                            color: homeController
                                                                            .languageSettings[
                                                                        "HI"] ==
                                                                    true
                                                                ? Colors.white
                                                                : AppColors
                                                                    .primaryColor,
                                                          ),
                                                        ),
                                                        title: Text(
                                                          "Hindi",
                                                          style: TextStyle(
                                                              color: homeController
                                                                              .languageSettings[
                                                                          "HI"] ==
                                                                      true
                                                                  ? Colors.white
                                                                  : AppColors
                                                                      .primaryColor),
                                                        ),
                                                        trailing: homeController
                                                                        .languageSettings[
                                                                    "HI"] ==
                                                                true
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
                                                                    .languageSettings[
                                                                "GU"] ==
                                                            true
                                                        ? AppColors.primaryColor
                                                        : Colors.white,
                                                    elevation: 5,
                                                    child: ListTile(
                                                        onTap: () {
                                                          homeController
                                                              .setLanguage(
                                                                  "GU");
                                                          setState(() {
                                                            context.locale =
                                                                const Locale(
                                                                    "gu");
                                                          });
                                                        },
                                                        leading: Text(
                                                          "GU",
                                                          style: TextStyle(
                                                            color: homeController
                                                                            .languageSettings[
                                                                        "GU"] ==
                                                                    true
                                                                ? Colors.white
                                                                : AppColors
                                                                    .primaryColor,
                                                          ),
                                                        ),
                                                        title: Text(
                                                          "Gujarati",
                                                          style: TextStyle(
                                                              color: homeController
                                                                              .languageSettings[
                                                                          "GU"] ==
                                                                      true
                                                                  ? Colors.white
                                                                  : AppColors
                                                                      .primaryColor),
                                                        ),
                                                        trailing: homeController
                                                                        .languageSettings[
                                                                    "GU"] ==
                                                                true
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
                                Card(
                                  elevation: 5,
                                  child: ListTile(
                                    onTap: () {},
                                    subtitle: Text(
                                      "0",
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
