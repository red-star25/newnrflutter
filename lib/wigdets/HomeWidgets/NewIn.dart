import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nrlifecare/constants/app_text_decoration.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class NewIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Container(
        width: 1.sw,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    child: Text(
                      "home_newin",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.sp,
                        fontFamily: "Roboto",
                      ),
                    ).tr(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
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
            ),
            SizedBox(
              height: 10.h,
            ),
            Flexible(
              child: SizedBox(
                height: 1.sh,
                child: ListView.builder(
                  // scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 8.0.w, horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 100.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.listColor["l${index + 1}"],
                                ),
                                child: Image.asset(
                                  "assets/images/test_product.png",
                                  height: 160.h,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                width: 10.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                      child: Text("NRCOF-TR",
                                          style: AppTextDecoration.bodyText4),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        "200/-",
                                        style: AppTextDecoration.bodyText1
                                            .copyWith(fontSize: 14.sp),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            "assets/icons/shopping-basket.svg",
                            color: AppColors.primaryColor,
                            width: 30.w,
                            height: 30.h,
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
