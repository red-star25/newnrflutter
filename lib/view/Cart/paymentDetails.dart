import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:nrlifecare/controller/CartController/cartController.dart';
import 'package:nrlifecare/wigdets/CustomSnackbar/customWidgets.dart';
import 'package:nrlifecare/wigdets/HomeWidgets/CustomAppBar.dart';
import 'package:nrlifecare/wigdets/HomeWidgets/FloatingButton.dart';

class PaymentDetails extends StatelessWidget {
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingButton(),
        resizeToAvoidBottomInset: true,
        body: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: SingleChildScrollView(
            child: Form(
              key: cartController.formKey,
              child: Column(
                children: [
                  CustomAppBar(),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Please Fill the Details",
                    style: AppTextDecoration.bodyText6,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Divider(
                    color: AppColors.primaryColor,
                    endIndent: 20.w,
                    indent: 20.w,
                    thickness: 0.8,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Card(
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.all(18.w),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: cartController.nameController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter name';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: 'Enter your name',
                                  icon: Icon(
                                    Icons.person,
                                    color: AppColors.primaryColor,
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: cartController.phoneNumberController,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter 10 Digit Mobile number';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText:
                                      'Please enter 10 Digit Mobile number',
                                  icon: Icon(
                                    Icons.phone,
                                    color: AppColors.primaryColor,
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              maxLines: 5,
                              textInputAction: TextInputAction.done,
                              controller: cartController.addressController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your address';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: 'Enter your address',
                                  icon: Icon(
                                    Icons.location_on,
                                    color: AppColors.primaryColor,
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          RaisedButton.icon(
                            color: AppColors.primaryColor,
                            onPressed: () async {
                              if (cartController.totalCartPrice > 0.0) {
                                if (cartController.formKey.currentState
                                    .validate()) {
                                  Get.defaultDialog(
                                      radius: 5,
                                      title: "Select Mode of Payment",
                                      titleStyle: AppTextDecoration.bodyText4,
                                      content: Column(
                                        children: [
                                          RaisedButton.icon(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            onPressed: () {
                                              Get.back();
                                              cartController.openCheckout();
                                            },
                                            color: AppColors.primaryColor,
                                            icon: const Icon(
                                                Icons.payment_rounded,
                                                color: Colors.white),
                                            label: const Text("Online Payment",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                          Divider(
                                            color: AppColors.primaryColor,
                                            endIndent: 20.w,
                                            indent: 20.w,
                                            thickness: 0.8,
                                          ),
                                          RaisedButton.icon(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            onPressed: () {
                                              Get.back();
                                              cartController.setMessage(
                                                  mode: "Cash on Delivery");
                                            },
                                            color: AppColors.secondaryColor,
                                            icon: const Icon(
                                              Icons.home_filled,
                                              color: Colors.white,
                                            ),
                                            label: const Text(
                                              "Cash On Delivery",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )
                                        ],
                                      ));
                                }
                              } else {
                                CustomWidgets.customPaymentSnackbar(
                                    message:
                                        "Add atleast one product to procees",
                                    title: "Please add product to cart",
                                    utfLogo: "❌");
                              }
                            },
                            icon: const Icon(
                              Icons.delivery_dining,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Place Order",
                              style: AppTextDecoration.bodyText4
                                  .copyWith(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
