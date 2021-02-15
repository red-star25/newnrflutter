import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nrlifecare/controller/ProductController/productController.dart';

class ProductBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();
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
              padding: EdgeInsets.only(top: 30.h, left: 25.w, right: 25.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text(
                      productController.selectedProduct.value.productName,
                      style: AppTextDecoration.heading2,
                    ).tr(),
                  ),
                  Obx(() => Text(
                        productController.selectedProduct.value.productSize,
                        style: AppTextDecoration.bodyText5,
                      ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h, left: 25.w, right: 25.w),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "product_price",
                                style: AppTextDecoration.bodyText5.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.normal),
                              ).tr(),
                              Obx(() => Text(
                                  productController
                                      .selectedProduct.value.productPrice
                                      .toString(),
                                  style: AppTextDecoration.bodyText5
                                      .copyWith(fontSize: 16.sp)))
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "minimum_order",
                                style: AppTextDecoration.bodyText5.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.normal),
                              ).tr(),
                              Obx(
                                () => Text(
                                    "${productController.selectedProduct.value.minimumOrder}/pack",
                                    style: AppTextDecoration.bodyText5
                                        .copyWith(fontSize: 16.sp)),
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
              padding: EdgeInsets.only(top: 30.h, left: 25.w, right: 25.w),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "drug_type",
                                style: AppTextDecoration.bodyText5.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.normal),
                              ).tr(),
                              Obx(() => Text(
                                  productController
                                      .selectedProduct.value.drugType,
                                  style: AppTextDecoration.bodyText5
                                      .copyWith(fontSize: 16.sp)))
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "recommended_for",
                                style: AppTextDecoration.bodyText5.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.normal),
                              ).tr(),
                              Obx(() => Text(
                                  productController
                                      .selectedProduct.value.recommendedFor,
                                  style: AppTextDecoration.bodyText5
                                      .copyWith(fontSize: 16.sp)))
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "storage_instruction",
                                style: AppTextDecoration.bodyText5.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.normal),
                              ).tr(),
                              Obx(() => Text(
                                  productController
                                      .selectedProduct.value.storageInstruction,
                                  style: AppTextDecoration.bodyText5
                                      .copyWith(fontSize: 16.sp)))
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "physical_form",
                                style: AppTextDecoration.bodyText5.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.normal),
                              ).tr(),
                              Obx(() => Text(
                                  productController
                                      .selectedProduct.value.physicalForm,
                                  style: AppTextDecoration.bodyText5
                                      .copyWith(fontSize: 16.sp)))
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "suitable_for",
                                style: AppTextDecoration.bodyText5.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.normal),
                              ).tr(),
                              Obx(() => Text(
                                    productController
                                        .selectedProduct.value.suitableFor,
                                    style: AppTextDecoration.bodyText5
                                        .copyWith(fontSize: 16.sp),
                                  ))
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
              padding: EdgeInsets.only(top: 30.h, left: 25.w, right: 25.w),
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
                          child: Obx(() => Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "👉 Uses",
                                    style: AppTextDecoration.bodyText5.copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                                  ).tr(),
                                  SizedBox(height: 10.h),
                                  for (int i = 0;
                                      i <
                                          productController.selectedProduct
                                              .value.uses.length;
                                      i++)
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.0.h),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            child: Obx(() => Text(
                                                  "💊 ${productController.selectedProduct.value.uses[i]}",
                                                  style: AppTextDecoration
                                                      .bodyText5
                                                      .copyWith(
                                                          fontSize: 16.sp),
                                                )),
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
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10.h,
                            left: 25.w,
                            right: 25.w,
                          ),
                          child: Obx(() => Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "👉 How to use Cefpodoxime PROXETIL",
                                    style: AppTextDecoration.bodyText5.copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                                  ).tr(),
                                  SizedBox(height: 10.h),
                                  for (int i = 0;
                                      i <
                                          productController.selectedProduct
                                              .value.howToUse.length;
                                      i++)
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.0.h),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            child: Obx(() => Text(
                                                  "💊 ${productController.selectedProduct.value.howToUse[i]}",
                                                  style: AppTextDecoration
                                                      .bodyText5
                                                      .copyWith(
                                                          fontSize: 16.sp),
                                                )),
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
                              )),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "payment_term",
                                      style: AppTextDecoration.bodyText5
                                          .copyWith(
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.normal),
                                    ).tr(),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Obx(() => Text(
                                        productController
                                            .selectedProduct.value.paymentTerms,
                                        style: AppTextDecoration.bodyText5
                                            .copyWith(fontSize: 16.sp))),
                                    Divider(
                                      indent: 20.w,
                                      endIndent: 20.w,
                                      color: AppColors.primaryColor,
                                    ),
                                    Text(
                                      "supply_ability",
                                      style: AppTextDecoration.bodyText5
                                          .copyWith(
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.normal),
                                    ).tr(),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Obx(() => Text(
                                        "${productController.selectedProduct.value.supplyAbility} Piece Per Day",
                                        style: AppTextDecoration.bodyText5
                                            .copyWith(fontSize: 16.sp)
                                            .copyWith(fontSize: 16.sp))),
                                    Divider(
                                      indent: 20.w,
                                      endIndent: 20.w,
                                      color: AppColors.primaryColor,
                                    ),
                                    Text(
                                      "main_domestic_market",
                                      style: AppTextDecoration.bodyText5
                                          .copyWith(
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.normal),
                                    ).tr(),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Obx(() => Text(
                                        productController.selectedProduct.value
                                                .mainDomesticMarket ??
                                            "",
                                        style: AppTextDecoration.bodyText5
                                            .copyWith(fontSize: 16.sp)))
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

            SizedBox(
              height: 15.h,
            )
          ],
        ),
      ),
    );
  }
}
