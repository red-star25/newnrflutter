import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/controller/CategoryController/categoryController.dart';
import 'package:nrlifecare/wigdets/GlobalWidgets/globalHeader.dart';
import 'package:nrlifecare/wigdets/HomeWidgets/FloatingButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'CategoryLeft.dart';
import 'CategoryRight.dart';

class NrCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () => Get.find<CategoryController>().onBackPress(),
        child: Scaffold(
          floatingActionButton: FloatingButton(),
          body: SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalHeader(title: "category_title"),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      CategoryLeftBody(),
                      SizedBox(
                        width: 20.h,
                      ),
                      CategoryRightBody()
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
