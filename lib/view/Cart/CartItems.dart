import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nrlifecare/controller/CartController/cartController.dart';
import 'package:nrlifecare/wigdets/CustomSnackbar/customWidgets.dart';
import 'package:nrlifecare/wigdets/ShimmerLoading/shimmerLoading.dart';
import 'package:easy_localization/easy_localization.dart';

class CartItems extends StatelessWidget {
  // final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartController>(
        init: CartController(),
        builder: (cartController) => SizedBox(
            width: 1.sw,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Users")
                    .doc(cartController.uId.toString())
                    .collection("cartProducts")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CategoryRightShimmer());
                  } else {
                    return AnimationLimiter(
                      child:
                          !cartController.isLoading &&
                                  cartController.cartItems.isNotEmpty
                              ? ListView.builder(
                                  itemCount: int.parse(
                                      snapshot.data.docs.length.toString()),
                                  itemBuilder: (context, index) {
                                    return AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 800),
                                      child: SlideAnimation(
                                        verticalOffset: 50.0,
                                        child: FadeInAnimation(
                                          child: Slidable(
                                            key: Key(snapshot
                                                .data.docs[index]["id"]
                                                .toString()),
                                            dismissal: SlidableDismissal(
                                              onDismissed: (_) {},
                                              onWillDismiss: (actionType) {
                                                return showDialog<bool>(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                              'delete_label')
                                                          .tr(),
                                                      content: const Text(
                                                              'sure_to_delete_text')
                                                          .tr(),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                          onPressed: () =>
                                                              Get.back(),
                                                          child: const Text(
                                                                  'no_label')
                                                              .tr(),
                                                        ),
                                                        FlatButton(
                                                          onPressed: () {
                                                            if (snapshot.data
                                                                            .docs[
                                                                        index][
                                                                    "categoryId"] !=
                                                                null) {
                                                              cartController
                                                                  .deleteCartProduct(
                                                                id: snapshot
                                                                    .data
                                                                    .docs[index]
                                                                        ["id"]
                                                                    .toString(),
                                                                categoryId: snapshot
                                                                    .data
                                                                    .docs[index]
                                                                        [
                                                                        "categoryId"]
                                                                    .toString(),
                                                              );
                                                            } else if (snapshot
                                                                            .data
                                                                            .docs[
                                                                        index][
                                                                    "categoryName"] ==
                                                                "TopProducts") {
                                                              cartController.deleteCartProduct(
                                                                  id: snapshot
                                                                      .data
                                                                      .docs[
                                                                          index]
                                                                          ["id"]
                                                                      .toString(),
                                                                  categoryName:
                                                                      "TopProducts");
                                                            } else if (snapshot
                                                                            .data
                                                                            .docs[
                                                                        index][
                                                                    "categoryName"] ==
                                                                "NewProducts") {
                                                              cartController.deleteCartProduct(
                                                                  id: snapshot
                                                                      .data
                                                                      .docs[
                                                                          index]
                                                                          ["id"]
                                                                      .toString(),
                                                                  categoryName:
                                                                      "NewProducts");
                                                            }
                                                            Get.back();
                                                          },
                                                          child: const Text(
                                                                  'yes_label')
                                                              .tr(),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              child:
                                                  const SlidableDrawerDismissal(),
                                            ),
                                            actionPane:
                                                const SlidableDrawerActionPane(),
                                            secondaryActions: [
                                              IconSlideAction(
                                                caption: 'Delete',
                                                color: AppColors.primaryColor,
                                                icon: Icons.delete,
                                                onTap: () {
                                                  if (snapshot.data.docs[index]
                                                          ["categoryId"] !=
                                                      null) {
                                                    cartController
                                                        .deleteCartProduct(
                                                      id: snapshot.data
                                                          .docs[index]["id"]
                                                          .toString(),
                                                      categoryId: snapshot
                                                          .data
                                                          .docs[index]
                                                              ["categoryId"]
                                                          .toString(),
                                                    );
                                                  } else if (snapshot
                                                              .data.docs[index]
                                                          ["categoryName"] ==
                                                      "TopProducts") {
                                                    cartController
                                                        .deleteCartProduct(
                                                            id: snapshot
                                                                .data
                                                                .docs[index]
                                                                    ["id"]
                                                                .toString(),
                                                            categoryName:
                                                                "TopProducts");
                                                  } else if (snapshot
                                                              .data.docs[index]
                                                          ["categoryName"] ==
                                                      "NewProducts") {
                                                    cartController
                                                        .deleteCartProduct(
                                                            id: snapshot
                                                                .data
                                                                .docs[index]
                                                                    ["id"]
                                                                .toString(),
                                                            categoryName:
                                                                "NewProducts");
                                                  }
                                                },
                                              ),
                                            ],
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.0.w),
                                              child: Card(
                                                elevation: 3,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        CachedNetworkImage(
                                                          imageUrl: snapshot
                                                              .data
                                                              .docs[index][
                                                                  "productImage"]
                                                              .toString(),
                                                          height: 100.h,
                                                          width: 100.w,
                                                          placeholder:
                                                              (_, __) =>
                                                                  SpinKitRipple(
                                                            color: AppColors
                                                                .primaryColor,
                                                          ),
                                                          fit: BoxFit.contain,
                                                          errorWidget: (context,
                                                                  _, __) =>
                                                              const Icon(
                                                            Icons.error_outline,
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10.w,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            FittedBox(
                                                              child: SizedBox(
                                                                width: 0.40.sw,
                                                                child: Text(
                                                                  snapshot
                                                                      .data
                                                                      .docs[
                                                                          index]
                                                                          [
                                                                          "productName"]
                                                                      .toString(),
                                                                  style: AppTextDecoration
                                                                      .bodyText4,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5.h,
                                                            ),
                                                            FittedBox(
                                                              child: Text(
                                                                  snapshot
                                                                      .data
                                                                      .docs[
                                                                          index]
                                                                          [
                                                                          "productSize"]
                                                                      .toString(),
                                                                  style: AppTextDecoration
                                                                      .subtitle2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis),
                                                            ),
                                                            SizedBox(
                                                              height: 10.h,
                                                            ),
                                                            Text(
                                                              "₹${snapshot.data.docs[index]["productPrice"].toString()} /-",
                                                              style:
                                                                  AppTextDecoration
                                                                      .bodyText4,
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 20.w),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          SizedBox(
                                                            height: 10.h,
                                                          ),
                                                          SvgPicture.asset(
                                                            "assets/icons/swipe-left.svg",
                                                            width: 30.w,
                                                            height: 30.h,
                                                            color: AppColors
                                                                .primaryColor,
                                                          ),
                                                          SizedBox(
                                                            height: 20.h,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "quantity_label",
                                                                style: AppTextDecoration
                                                                    .bodyText2,
                                                              ).tr(),
                                                              Text(
                                                                snapshot
                                                                    .data
                                                                    .docs[index]
                                                                        [
                                                                        "userQuantity"]
                                                                    .toString(),
                                                                style: AppTextDecoration
                                                                    .bodyText3,
                                                              ),
                                                              SizedBox(
                                                                width: 10.w,
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  Get.defaultDialog(
                                                                    barrierDismissible:
                                                                        true,
                                                                    middleText:
                                                                        "Enter quantity of product",
                                                                    title:
                                                                        "Enter quantity of product",
                                                                    titleStyle:
                                                                        AppTextDecoration
                                                                            .bodyText4,
                                                                    cancel: OutlineButton.icon(
                                                                        onPressed: () {
                                                                          cartController
                                                                              .quantityController
                                                                              .clear();
                                                                          Get.back();
                                                                        },
                                                                        icon: const Icon(Icons.close, color: Colors.red),
                                                                        label: const Text("close_label").tr()),
                                                                    confirm: RaisedButton.icon(
                                                                        color: AppColors.primaryColor,
                                                                        icon: const Icon(
                                                                          Icons
                                                                              .check,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                        label: const Text(
                                                                          "submit_label",
                                                                          style:
                                                                              TextStyle(color: Colors.white),
                                                                        ).tr(),
                                                                        onPressed: () async {
                                                                          if (int.parse(cartController.quantityController.text) >
                                                                              0) {
                                                                            await cartController.setUserQuantity(
                                                                                pId: snapshot.data.docs[index]["id"].toString(),
                                                                                quantity: cartController.quantityController.text);
                                                                            cartController.quantityController.clear();
                                                                            Get.back();
                                                                          } else {
                                                                            CustomWidgets.customAuthSnackbar(
                                                                                message: "Please add quantity above 1",
                                                                                title: "Invalid quantity");
                                                                          }
                                                                        }),
                                                                    content:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .only(
                                                                        left: 15.0
                                                                            .w,
                                                                        right:
                                                                            15.w,
                                                                        bottom:
                                                                            15.h,
                                                                      ),
                                                                      child:
                                                                          TextField(
                                                                        keyboardType:
                                                                            TextInputType.number,
                                                                        controller:
                                                                            cartController.quantityController,
                                                                        onSubmitted:
                                                                            (value) async {
                                                                          if (int.parse(cartController.quantityController.text) >
                                                                              0) {
                                                                            await cartController.setUserQuantity(
                                                                                pId: snapshot.data.docs[index]["id"].toString(),
                                                                                quantity: cartController.quantityController.text);
                                                                            cartController.quantityController.clear();
                                                                            Get.back();
                                                                          } else {
                                                                            CustomWidgets.customAuthSnackbar(
                                                                                message: "Please add quantity above 1",
                                                                                title: "Invalid quantity");
                                                                          }
                                                                        },
                                                                        decoration: const InputDecoration(
                                                                            labelText:
                                                                                "Quantity",
                                                                            border:
                                                                                OutlineInputBorder()),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: Icon(
                                                                  Icons.edit,
                                                                  color: AppColors
                                                                      .primaryColor,
                                                                  size: 20.h,
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : cartController.cartItems.isNotEmpty
                                  ? Center(
                                      child: SpinKitRipple(
                                          color: AppColors.primaryColor),
                                    )
                                  : Image.asset(
                                      "assets/images/empty_cart.png",
                                      fit: BoxFit.contain,
                                    ),
                    );
                  }
                })),
      ),
    );
  }
}
