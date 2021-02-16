import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/controller/CategoryController/categoryController.dart';

class CategoryLeftBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Container(
            width: 0.15.sw,
            height: 0.82.sh,
            padding: EdgeInsets.only(left: 15.w),
            child: GetBuilder<CategoryController>(
              init: CategoryController(),
              builder: (categoryController) {
                return ListView.separated(
                  itemCount: categoryController.categoryList.value.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 25.h,
                    );
                  },
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        categoryController.setSelectedCategory(index);
                      },
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Column(
                          children: [
                            Text(
                                categoryController
                                    .categoryList.value[index].categoryName
                                    .toString(),
                                style: AppTextDecoration.bodyText6),
                            categoryController
                                        .categoryList.value[index].isSelected ==
                                    true
                                ? RotatedBox(
                                    quarterTurns: 1,
                                    child: Text(
                                      "⫶",
                                      style: AppTextDecoration.bodyText5
                                          .copyWith(fontSize: 50.sp),
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
