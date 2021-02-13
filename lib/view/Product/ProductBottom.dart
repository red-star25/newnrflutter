import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nrlifecare/controller/ProductController/productController.dart';

class ProductBottom extends StatelessWidget {
  // final productController = Get.put(ProductController());
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
                          "NRCOF-TR",
                          style: AppTextDecoration.heading2,
                        ).tr(),
                        Text(
                          "60ml",
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
                                    Text("₹45.00",
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
                                    Text("30/pack",
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
                                    Text("General Medicines",
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
                                    Text("Cough",
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
                                    Text("Dry Place",
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
                                    Text("Liquid",
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
                                      "Adults, Women",
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
                                    Text(
                                      "💊 This medication is used to treat a wide variety of bacterial infections. This medication is known as a cephalosporin antibiotic. It works by stopping the growth of bacteria.",
                                      style: AppTextDecoration.bodyText5
                                          .copyWith(fontSize: 16.sp),
                                    ),
                                    Divider(
                                      indent: 20.w,
                                      endIndent: 20.w,
                                      color: AppColors.primaryColor,
                                    ),
                                    Text(
                                      "💊 This antibiotic treats only bacterial infections. It will not work for viral infections (e.g., common cold, flu). Unnecessary use or misuse of any antibiotic can lead to its decreased effectiveness.",
                                      style: AppTextDecoration.bodyText5
                                          .copyWith(fontSize: 16.sp),
                                    )
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
                                    Text(
                                      "💊 Take this medication by mouth, usually every 12 hours or as directed by your doctor.",
                                      style: AppTextDecoration.bodyText5
                                          .copyWith(fontSize: 16.sp),
                                    ),
                                    Divider(
                                      indent: 20.w,
                                      endIndent: 20.w,
                                      color: AppColors.primaryColor,
                                    ),
                                    Text(
                                      "💊 Take this medication by mouth, usually every 12 hours or as directed by your doctor.",
                                      style: AppTextDecoration.bodyText5
                                          .copyWith(fontSize: 16.sp),
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
                                              "Cash in Advance (CID), Cash Advance (CA)",
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
                                          Text("20,000 Piece Per Day",
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
                                          Text("All India",
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
                            controller: productController.quantityController,
                            onSubmitted: (value) {
                              productController.productQuantity.value = value;
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
