import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:nrlifecare/controller/CartController/cartController.dart';
import 'package:nrlifecare/wigdets/HomeWidgets/CustomAppBar.dart';
import 'package:nrlifecare/wigdets/HomeWidgets/FloatingButton.dart';

class CashOnDelivery extends StatelessWidget {
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
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
                                hintText: 'Please enter 10 Digit Mobile number',
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
                            if (cartController.formKey.currentState
                                .validate()) {
                              await FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(cartController.uId)
                                  .collection("cartProducts")
                                  .get()
                                  .then((value) {
                                final productName = [];
                                final productQuantity = [];

                                for (var i = 0; i < value.docs.length; i++) {
                                  productName.add(
                                      value.docs[i]["productName"].toString());
                                  productQuantity.add(
                                      value.docs[i]["userQuantity"].toString());
                                }

                                final product = productName.reduce(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    (value, element) => value + "," + element);

                                final quantity = productQuantity.reduce(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    (value, element) => value + "," + element);

                                cartController.smsMessage =
                                    "Cash On Delivery:\nProducts:\n$product\n\nQuantity:\n$quantity\n\nName: ${cartController.userName}\nAddress :${cartController.addressController.text}\nPhone Number :${cartController.phoneNumberController.text}";
                              }).then((value) {
                                cartController.smsSend();
                              });
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
