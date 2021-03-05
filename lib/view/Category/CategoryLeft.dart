import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/controller/CategoryController/categoryController.dart';
import 'package:nrlifecare/wigdets/ShimmerLoading/shimmerLoading.dart';

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
                return StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Categories")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return CategoryLeftShimmer();
                      } else {
                        return AnimationLimiter(
                          child: ListView.separated(
                            itemCount: int.parse(
                              snapshot.data.docs.length.toString(),
                            ),
                            separatorBuilder: (context, index) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: SizedBox(
                                      height: 25.h,
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  categoryController.setSelectedCategory(index);
                                  categoryController.setCategoryId(snapshot
                                      .data.docs[index]["id"]
                                      .toString());
                                },
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: Column(
                                    children: [
                                      Text(
                                          snapshot
                                              .data.docs[index]["categoryName"]
                                              .toString(),
                                          style: AppTextDecoration.bodyText6),
                                      if (categoryController.categoryList
                                              .value[index].isSelected ==
                                          true)
                                        RotatedBox(
                                          quarterTurns: 1,
                                          child: Text(
                                            "⫶",
                                            style: AppTextDecoration.bodyText5
                                                .copyWith(fontSize: 50.sp),
                                          ),
                                        )
                                      else
                                        Container()
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
