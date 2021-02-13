import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:nrlifecare/controller/CategoryController/categoryController.dart';

class CategoryRightBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("building...");
    // final categoryController = Get.put(CategoryController());
    return Flexible(
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        elevation: 10,
        child: GetBuilder<CategoryController>(
          init: CategoryController(),
          builder: (categoryController) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              categoryController.isSearchVisible
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 8.0.h),
                          child: SizedBox(
                            height: 80.h,
                            width: 350.w,
                            child: FloatingSearchBar(
                              automaticallyImplyBackButton: false,
                              backgroundColor: Colors.white,
                              backdropColor: Colors.white,
                              hint: 'Search...',
                              transitionDuration:
                                  const Duration(milliseconds: 800),
                              debounceDelay: const Duration(milliseconds: 500),
                              transition: CircularFloatingSearchBarTransition(),
                              transitionCurve: Curves.easeInOut,
                              physics: const BouncingScrollPhysics(),
                              onSubmitted: (value) {
                                categoryController.updateIsSearchVisible(
                                    value: false);
                                categoryController.update();
                              },
                              hintStyle: AppTextDecoration.subtitle4,
                              builder: (context, transition) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Material(
                                    color: Colors.white,
                                    elevation: 4.0,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: Colors.accents.map((color) {
                                        return Container(
                                            height: 112, color: color);
                                      }).toList(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0.w, top: 20.h),
                          child: Text(
                            "Products",
                            style: AppTextDecoration.heading2,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            categoryController.updateIsSearchVisible(
                                value: true);
                            categoryController.update();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 20.0.w, top: 20.h),
                            child: SvgPicture.asset(
                              "assets/icons/search_icon.svg",
                              width: 30.w,
                              height: 30.h,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
              Divider(
                color: AppColors.primaryColor,
                thickness: 1,
                endIndent: 20.w,
                indent: 20.w,
              ),
              SizedBox(
                width: 0.8.sw,
                height: 0.74.sh,
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 5,
                          child: Row(
                            children: [
                              Container(
                                width: 10.w,
                                height: 150.h,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        categoryController
                                            .productList[index].productName
                                            .toString(),
                                        style: AppTextDecoration.bodyText6,
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "₹ ${categoryController.productList[index].productPrice.toString()}",
                                                style:
                                                    AppTextDecoration.bodyText4,
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Text(
                                                "Quantity",
                                                style:
                                                    AppTextDecoration.bodyText2,
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              SizedBox(
                                                width: 80.w,
                                                height: 30.h,
                                                child: Center(
                                                    child: TextFormField(
                                                  initialValue: "100",
                                                  onFieldSubmitted: (value) {
                                                    categoryController
                                                        .updateProductQuantity(
                                                            index: index,
                                                            quantity: int.parse(
                                                                value));
                                                  },
                                                  decoration: InputDecoration(
                                                      border:
                                                          const OutlineInputBorder(),
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 15.w)),
                                                )),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  categoryController
                                                      .addProductToCartToggle(
                                                          index: index);
                                                },
                                                child: Container(
                                                  width: 100.w,
                                                  height: 30.h,
                                                  decoration: BoxDecoration(
                                                      color: categoryController
                                                                  .productList[
                                                                      index]
                                                                  .isAdded ==
                                                              false
                                                          ? AppColors
                                                              .primaryColor
                                                          : AppColors
                                                              .secondaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Center(
                                                    child: Text(
                                                        categoryController
                                                                    .productList[
                                                                        index]
                                                                    .isAdded ==
                                                                false
                                                            ? "Add to cart"
                                                            : "Added",
                                                        style: AppTextDecoration
                                                            .bodyText2
                                                            .copyWith(
                                                          color: categoryController
                                                                      .productList[
                                                                          index]
                                                                      .isAdded ==
                                                                  false
                                                              ? Colors.white
                                                              : Colors.black,
                                                        )),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Image.asset(
                                            "assets/images/test_product.png",
                                            height: 120.h,
                                            width: 120.w,
                                            fit: BoxFit.contain,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ));
                    },
                    itemCount: categoryController.productList.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
