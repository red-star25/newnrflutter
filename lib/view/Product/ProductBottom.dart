import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nrlifecare/controller/ProductController/productController.dart';

class ProductBottom extends StatelessWidget {
  // final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        init: ProductController(),
        builder: (productController) {
          return Card(
            elevation: 5,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Name and Quantity
                  Padding(
                    padding:
                        EdgeInsets.only(top: 30.h, left: 25.w, right: 25.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productController.selectedProduct.productName,
                          style: AppTextDecoration.heading2,
                        ).tr(),
                        Text(
                          productController.selectedProduct.productSize,
                          style: AppTextDecoration.bodyText5,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 30.h, left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "product_price_and_quantity",
                          style: AppTextDecoration.bodyText6,
                        ).tr(),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          width: 1.sw,
                          height: 120.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.shadow1,
                                  offset: const Offset(0, 6),
                                  blurRadius: 10,
                                  spreadRadius: 1.5)
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 10.h,
                                  left: 25.w,
                                  right: 25.w,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "product_price",
                                      style: AppTextDecoration.bodyText5
                                          .copyWith(
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.normal),
                                    ).tr(),
                                    Text(
                                        productController
                                            .selectedProduct.productPrice
                                            .toString(),
                                        style: AppTextDecoration.bodyText5
                                            .copyWith(fontSize: 16.sp))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 10.h,
                                  left: 25.w,
                                  right: 25.w,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "minimum_order",
                                      style: AppTextDecoration.bodyText5
                                          .copyWith(
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.normal),
                                    ).tr(),
                                    Text(
                                        "${productController.selectedProduct.minimumOrder}/pack",
                                        style: AppTextDecoration.bodyText5
                                            .copyWith(fontSize: 16.sp))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 30.h, left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "product_specifications",
                          style: AppTextDecoration.bodyText6,
                        ).tr(),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          width: 1.sw,
                          // height: 120.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.shadow1,
                                  offset: const Offset(0, 6),
                                  blurRadius: 10,
                                  spreadRadius: 1.5)
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 10.h,
                                  left: 25.w,
                                  right: 25.w,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "drug_type",
                                      style: AppTextDecoration.bodyText5
                                          .copyWith(
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.normal),
                                    ).tr(),
                                    Text(
                                        productController
                                            .selectedProduct.drugType,
                                        style: AppTextDecoration.bodyText5
                                            .copyWith(fontSize: 16.sp))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 10.h,
                                  left: 25.w,
                                  right: 25.w,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "recommended_for",
                                      style: AppTextDecoration.bodyText5
                                          .copyWith(
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.normal),
                                    ).tr(),
                                    Text(
                                        productController
                                            .selectedProduct.recommendedFor,
                                        style: AppTextDecoration.bodyText5
                                            .copyWith(fontSize: 16.sp))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 10.h,
                                  left: 25.w,
                                  right: 25.w,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "storage_instruction",
                                      style: AppTextDecoration.bodyText5
                                          .copyWith(
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.normal),
                                    ).tr(),
                                    Text(
                                        productController
                                            .selectedProduct.storageInstruction,
                                        style: AppTextDecoration.bodyText5
                                            .copyWith(fontSize: 16.sp))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 10.h,
                                  left: 25.w,
                                  right: 25.w,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "physical_form",
                                      style: AppTextDecoration.bodyText5
                                          .copyWith(
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.normal),
                                    ).tr(),
                                    Text(
                                        productController
                                            .selectedProduct.physicalForm,
                                        style: AppTextDecoration.bodyText5
                                            .copyWith(fontSize: 16.sp))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 10.h,
                                  left: 25.w,
                                  right: 25.w,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "suitable_for",
                                      style: AppTextDecoration.bodyText5
                                          .copyWith(
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.normal),
                                    ).tr(),
                                    Text(
                                      productController
                                          .selectedProduct.suitableFor,
                                      style: AppTextDecoration.bodyText5
                                          .copyWith(fontSize: 16.sp),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 30.h, left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "product_description",
                          style: AppTextDecoration.bodyText6,
                        ).tr(),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          width: 1.sw,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.shadow1,
                                  offset: const Offset(0, 6),
                                  blurRadius: 10,
                                  spreadRadius: 1.5)
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 10.h,
                                  left: 25.w,
                                  right: 25.w,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "👉 Uses",
                                      style:
                                          AppTextDecoration.bodyText5.copyWith(
                                        color: AppColors.primaryColor,
                                      ),
                                    ).tr(),
                                    SizedBox(height: 10.h),
                                    for (int i = 0;
                                        i <
                                            productController
                                                .selectedProduct.uses.length;
                                        i++)
                                      Padding(
                                        padding: EdgeInsets.only(top: 10.0.h),
                                        child: Row(
                                          children: [
                                            Flexible(
                                              child: Text(
                                                "💊 ${productController.selectedProduct.uses[i]}",
                                                style: AppTextDecoration
                                                    .bodyText5
                                                    .copyWith(fontSize: 16.sp),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    Divider(
                                      indent: 20.w,
                                      endIndent: 20.w,
                                      color: AppColors.primaryColor,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 10.h,
                                  left: 25.w,
                                  right: 25.w,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "👉 How to use Cefpodoxime PROXETIL",
                                      style:
                                          AppTextDecoration.bodyText5.copyWith(
                                        color: AppColors.primaryColor,
                                      ),
                                    ).tr(),
                                    SizedBox(height: 10.h),
                                    for (int i = 0;
                                        i <
                                            productController.selectedProduct
                                                .howToUse.length;
                                        i++)
                                      Padding(
                                        padding: EdgeInsets.only(top: 10.0.h),
                                        child: Row(
                                          children: [
                                            Flexible(
                                              child: Text(
                                                "💊 ${productController.selectedProduct.howToUse[i]}",
                                                style: AppTextDecoration
                                                    .bodyText5
                                                    .copyWith(fontSize: 16.sp),
                                              ),
                                            ),
                                            Divider(
                                              indent: 20.w,
                                              endIndent: 20.w,
                                              color: AppColors.primaryColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    SizedBox(height: 10.h),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 30.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "product_trade_information",
                                style: AppTextDecoration.bodyText6,
                              ).tr(),
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                width: 1.sw,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.shadow1,
                                        offset: const Offset(0, 6),
                                        blurRadius: 10,
                                        spreadRadius: 1.5)
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 10.h,
                                        left: 25.w,
                                        right: 25.w,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "payment_term",
                                            style: AppTextDecoration.bodyText5
                                                .copyWith(
                                                    color:
                                                        AppColors.primaryColor,
                                                    fontWeight:
                                                        FontWeight.normal),
                                          ).tr(),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                              productController
                                                  .selectedProduct.paymentTerms,
                                              style: AppTextDecoration.bodyText5
                                                  .copyWith(fontSize: 16.sp)),
                                          Divider(
                                            indent: 20.w,
                                            endIndent: 20.w,
                                            color: AppColors.primaryColor,
                                          ),
                                          Text(
                                            "supply_ability",
                                            style: AppTextDecoration.bodyText5
                                                .copyWith(
                                                    color:
                                                        AppColors.primaryColor,
                                                    fontWeight:
                                                        FontWeight.normal),
                                          ).tr(),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                              "${productController.selectedProduct.supplyAbility} Piece Per Day",
                                              style: AppTextDecoration.bodyText5
                                                  .copyWith(fontSize: 16.sp)
                                                  .copyWith(fontSize: 16.sp)),
                                          Divider(
                                            indent: 20.w,
                                            endIndent: 20.w,
                                            color: AppColors.primaryColor,
                                          ),
                                          Text(
                                            "main_domestic_market",
                                            style: AppTextDecoration.bodyText5
                                                .copyWith(
                                                    color:
                                                        AppColors.primaryColor,
                                                    fontWeight:
                                                        FontWeight.normal),
                                          ).tr(),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                              productController.selectedProduct
                                                      .mainDomesticMarket ??
                                                  "",
                                              style: AppTextDecoration.bodyText5
                                                  .copyWith(fontSize: 16.sp))
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 30.h,
                      left: 25.w,
                      right: 25.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150.w,
                          height: 80.h,
                          child: Center(
                              child: TextField(
                            controller: Get.find<ProductController>()
                                .quantityController,
                            onSubmitted: (value) {
                              Get.find<ProductController>()
                                  .productQuantity
                                  .value = value.toString();
                            },
                            decoration: InputDecoration(
                                labelText: "Quantity",
                                // hintText: "Quantity:",
                                // border: InputBorder.none,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: AppColors.primaryColor,
                                        width: 1.5)),
                                hintStyle: AppTextDecoration.bodyText4
                                    .copyWith(fontWeight: FontWeight.normal),
                                contentPadding: EdgeInsets.only(left: 15.w)),
                          )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 25.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 200.w,
                                height: 80.h,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    "Add to cart",
                                    style: AppTextDecoration.heading1
                                        .copyWith(fontSize: 24.sp),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  )
                ],
              ),
            ),
          );
        });
  }
}
