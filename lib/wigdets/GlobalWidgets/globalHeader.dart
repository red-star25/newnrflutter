import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nrlifecare/controller/CartController/cartController.dart';
import 'package:nrlifecare/wigdets/CustomSnackbar/customWidgets.dart';

// ignore: must_be_immutable
class GlobalHeader extends StatelessWidget {
  String title;
  bool hasCheckoutButton, hasPadding;
  GlobalHeader(
      {@required this.title,
      this.hasCheckoutButton = false,
      this.hasPadding = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: hasPadding
                      ? EdgeInsets.only(top: 20.h, left: 40.w, bottom: 20.h)
                      : EdgeInsets.only(left: 20.w, bottom: 30.h, top: 10.h),
                  child: Text(
                    title,
                    style: AppTextDecoration.heading3
                        .copyWith(color: Colors.white),
                  ).tr(),
                ),
              ),
            ],
          ),
          if (hasCheckoutButton)
            Padding(
              padding: EdgeInsets.only(right: 8.0.w),
              child: RaisedButton.icon(
                onPressed: () async {
                  Get.toNamed("/paymentDetails");
                },
                label: Text("cart_checkout",
                        style: AppTextDecoration.bodyText4
                            .copyWith(color: Colors.black))
                    .tr(),
                icon: Icon(
                  Icons.payment_outlined,
                  color: Colors.black,
                  size: 25.h,
                ),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                color: AppColors.secondaryColor,
              ),
            )
          else
            Container()
        ],
      ),
    );
  }
}
