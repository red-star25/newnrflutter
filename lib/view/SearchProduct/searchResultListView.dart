import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:nrlifecare/controller/CategoryController/categoryController.dart';

class SearchResultsListView extends StatelessWidget {
  final String searchTerm;

  SearchResultsListView({
    Key key,
    @required this.searchTerm,
  }) : super(key: key);

  final categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    if (searchTerm == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search,
              size: 64.h,
              color: AppColors.primaryColor,
            ),
            Text(
              'Search Product',
              style: AppTextDecoration.bodyText4,
            )
          ],
        ),
      );
    }

    return categoryController.searchedProducts.value.isNotEmpty
        ? ListView.builder(
            itemCount: categoryController.searchedProducts.value.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 8.0.w, right: 8.0.w, top: 80.h),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() => Text(
                                    categoryController.searchedProducts
                                        .value[index].productName,
                                    style: AppTextDecoration.bodyText6,
                                  )),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Obx(() => Text(
                                            "₹ ${categoryController.searchedProducts.value[index].productPrice.toString()}",
                                            style: AppTextDecoration.bodyText4,
                                          )),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        "Quantity",
                                        style: AppTextDecoration.bodyText2,
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
                                                    quantity: int.parse(value));
                                          },
                                          decoration: InputDecoration(
                                              border:
                                                  const OutlineInputBorder(),
                                              contentPadding:
                                                  EdgeInsets.only(left: 15.w)),
                                        )),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          categoryController
                                              .addProductToCartToggle(
                                                  id: categoryController
                                                      .searchedProducts
                                                      .value[index]
                                                      .id);
                                        },
                                        child: Obx(
                                          () => Container(
                                            width: 100.w,
                                            height: 30.h,
                                            decoration: BoxDecoration(
                                                color: categoryController
                                                            .searchedProducts
                                                            .value[index]
                                                            .isAdded ==
                                                        false
                                                    ? AppColors.primaryColor
                                                    : AppColors.secondaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Center(
                                              child: Obx(
                                                () => Text(
                                                  categoryController
                                                              .searchedProducts
                                                              .value[index]
                                                              .isAdded ==
                                                          false
                                                      ? "Add to cart"
                                                      : "Added",
                                                  style: AppTextDecoration
                                                      .bodyText2
                                                      .copyWith(
                                                    color: categoryController
                                                                .searchedProducts
                                                                .value[index]
                                                                .isAdded ==
                                                            false
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Obx(() => Image.asset(
                                        categoryController.searchedProducts
                                            .value[index].productImage,
                                        height: 120.h,
                                        width: 120.w,
                                        fit: BoxFit.contain,
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        : Center(
            child: Text("No product found"),
          );
  }
}
