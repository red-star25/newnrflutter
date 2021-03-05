import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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
                  if (Get.find<CartController>().totalCartPrice > 0.0) {
                    await Geolocator.requestPermission();
                    Get.defaultDialog(
                        radius: 5,
                        title: "Select Mode of Payment",
                        titleStyle: AppTextDecoration.bodyText4,
                        content: Column(
                          children: [
                            RaisedButton.icon(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              onPressed: () {
                                Get.find<CartController>().openCheckout();
                              },
                              color: AppColors.primaryColor,
                              icon: const Icon(Icons.payment_rounded,
                                  color: Colors.white),
                              label: const Text("Online Payment",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Divider(
                              color: AppColors.primaryColor,
                              endIndent: 20.w,
                              indent: 20.w,
                              thickness: 0.8,
                            ),
                            RaisedButton.icon(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              onPressed: () {
                                Get.back();
                                Get.toNamed("/cashOnDelivery");
                              },
                              color: AppColors.secondaryColor,
                              icon: const Icon(
                                Icons.home_filled,
                                color: Colors.white,
                              ),
                              label: const Text(
                                "Cash On Delivery",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ));
                  } else {
                    CustomWidgets.customPaymentSnackbar(
                        message: "Add atleast one product to procees",
                        title: "Please add product to cart",
                        utfLogo: "❌");
                  }
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
