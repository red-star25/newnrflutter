import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:easy_localization/easy_localization.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                child: Text(
                  "home_categories",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                    fontFamily: "Roboto",
                  ),
                ).tr(),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: FittedBox(
                    child: Text(
                      "home_see_all",
                      style: AppTextDecoration.bodyText1,
                    ).tr(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 0.16.sh,
            width: 1.sw,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: AppColors.listColor["l${8 - (index + 1)}"],
                          width: 105.w,
                          height: 100.h,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Image.asset(
                              "assets/images/test_product.png",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      FittedBox(
                        child: Text(
                          "Test",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.7),
                        ),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      width: 10.w,
                    ),
                itemCount: 5),
          ),
        ],
      ),
    );
  }
}
