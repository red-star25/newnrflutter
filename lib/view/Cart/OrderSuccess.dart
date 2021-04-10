import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:nrlifecare/controller/HomeController/homeController.dart';

class OrderSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/images/orderConfirmed.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            RaisedButton.icon(
              color: AppColors.primaryColor,
              onPressed: () {
                Get.find<HomeController>().updateSelectedFabIcon(1);
                Get.offAllNamed("/home");
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              label: Text(
                "Go back to Home",
                style:
                    AppTextDecoration.bodyText4.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
