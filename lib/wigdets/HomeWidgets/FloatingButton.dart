import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nrlifecare/controller/HomeController/homeController.dart';

class FloatingButton extends StatelessWidget {
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homeController) {
          return FabCircularMenu(
              animationDuration: const Duration(milliseconds: 500),
              ringColor: AppColors.primaryColor,
              ringWidth: 70.w,
              fabSize: 50.h,
              ringDiameter: 350.h,
              fabOpenColor: AppColors.secondaryColor,
              fabCloseIcon:
                  Icon(Icons.close, color: AppColors.primaryColor, size: 30.h),
              fabOpenIcon: Icon(
                Icons.dehaze_sharp,
                color: Colors.white,
                size: 30.h,
              ),
              fabColor: AppColors.primaryColor,
              children: <Widget>[
                InkWell(
                    child: Icon(
                      Icons.home,
                      color: homeController.selectedFabIcon == 1
                          ? AppColors.secondaryColor
                          : Colors.white,
                      size: 30.h,
                    ),
                    onTap: () {
                      homeController.updateSelectedFabIcon(1);
                      Get.toNamed("/home");
                    }),
                InkWell(
                    child: Icon(
                      Icons.category_outlined,
                      color: homeController.selectedFabIcon == 2
                          ? AppColors.secondaryColor
                          : Colors.white,
                      size: 30.h,
                    ),
                    onTap: () {
                      homeController.updateSelectedFabIcon(2);
                      Get.toNamed("/category");
                    }),
                InkWell(
                  onTap: () {
                    homeController.updateSelectedFabIcon(3);
                    Get.toNamed("/cart");
                  },
                  child: SvgPicture.asset(
                    "assets/icons/shopping-basket.svg",
                    color: homeController.selectedFabIcon == 3
                        ? AppColors.secondaryColor
                        : Colors.white,
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
                InkWell(
                    child: Icon(
                      Icons.people_alt_outlined,
                      color: homeController.selectedFabIcon == 4
                          ? AppColors.secondaryColor
                          : Colors.white,
                      size: 30.h,
                    ),
                    onTap: () {
                      homeController.updateSelectedFabIcon(4);
                      Get.toNamed("/aboutUs");
                    }),
                InkWell(
                    child: Icon(
                      Icons.business_sharp,
                      color: homeController.selectedFabIcon == 5
                          ? AppColors.secondaryColor
                          : Colors.white,
                      size: 30.h,
                    ),
                    onTap: () {
                      homeController.updateSelectedFabIcon(5);
                      Get.toNamed("/contactUs");
                    })
              ]);
        });
  }
}
