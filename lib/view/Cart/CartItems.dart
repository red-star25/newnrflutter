import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nrlifecare/controller/CartController/cartController.dart';

class CartItems extends StatelessWidget {
  // final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartController>(
        init: CartController(),
        builder: (cartController) => SizedBox(
          width: 1.sw,
          child: cartController.cartItems.value.isNotEmpty
              ? ListView.builder(
                  itemCount: cartController.cartItems.value.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      key: Key(
                          cartController.cartItems.value[index].id.toString()),
                      dismissal: SlidableDismissal(
                        child: SlidableDrawerDismissal(),
                        onDismissed: (_) {},
                        onWillDismiss: (actionType) {
                          return showDialog<bool>(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Delete'),
                                content: Text(
                                    'Are you sure you want to delete this product ?'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('No'),
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                  ),
                                  FlatButton(
                                    child: Text('Yes'),
                                    onPressed: () {
                                      cartController.deleteCartProduct(index);
                                      Navigator.of(context).pop(true);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      actionPane: const SlidableDrawerActionPane(),
                      secondaryActions: [
                        IconSlideAction(
                          caption: 'Delete',
                          color: AppColors.primaryColor,
                          icon: Icons.delete,
                          onTap: () {
                            cartController.deleteCartProduct(index);
                          },
                        ),
                      ],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: Row(
                              children: [
                                Obx(() => Image.asset(
                                      cartController
                                          .cartItems.value[index].productImage
                                          .toString(),
                                      height: 100.h,
                                      width: 100.h,
                                      fit: BoxFit.contain,
                                    )),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(() => Text(
                                          cartController.cartItems.value[index]
                                              .productName
                                              .toString(),
                                          style: AppTextDecoration.heading2,
                                        )),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Obx(() => Text(
                                          cartController.cartItems.value[index]
                                              .productSize
                                              .toString(),
                                          style: AppTextDecoration.bodyText5,
                                        )),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Obx(() => Text(
                                          "₹ ${cartController.cartItems.value[index].productPrice.toString()} /-",
                                          style: AppTextDecoration.bodyText4,
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20.w),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        IconButton(
                                          padding: EdgeInsets.only(top: 15.h),
                                          icon: Icon(
                                            Icons.add,
                                            size: 25.h,
                                          ),
                                          onPressed: () {
                                            cartController
                                                .updateProductQuantity(
                                                    index, "INCREMENT");
                                          },
                                        ),
                                        Container(
                                          height: 30.h,
                                          width: 35.w,
                                          decoration: BoxDecoration(
                                              color: AppColors.primaryColor,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(5))),
                                          child: Center(
                                            child: Obx(() => Text(
                                                  cartController.cartItems
                                                      .value[index].minimumOrder
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.sp,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                )),
                                          ),
                                        ),
                                        IconButton(
                                          padding:
                                              EdgeInsets.only(bottom: 15.h),
                                          icon: Icon(
                                            Icons.remove,
                                            size: 25.h,
                                          ),
                                          onPressed: () {
                                            cartController
                                                .updateProductQuantity(
                                                    index, "DECREMENT");
                                          },
                                        ),
                                      ],
                                    ),
                                    SvgPicture.asset(
                                      "assets/icons/swipe-left.svg",
                                      width: 30.w,
                                      height: 30.h,
                                      color: AppColors.primaryColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text("No Products in Cart"),
                ),
        ),
      ),
    );
  }
}
