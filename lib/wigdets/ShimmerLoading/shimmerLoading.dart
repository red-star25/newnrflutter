import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

final baseColor = Colors.grey[300];
final highlightColor = Colors.grey[100];
// ignore: non_constant_identifier_names
Widget TopProductShimmer() {
  return Shimmer.fromColors(
    baseColor: baseColor,
    highlightColor: highlightColor,
    child: ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        width: 10.w,
      ),
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, __) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: 150.w, height: 10.h, color: Colors.white),
            SizedBox(
              height: 10.h,
            ),
            Container(width: 80.w, height: 10.h, color: Colors.white),
            SizedBox(
              height: 10.h,
            ),
            Container(
                width: 170.w,
                height: 150.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10))),
            SizedBox(
              height: 10.h,
            ),
            Container(width: 150.w, height: 10.h, color: Colors.white),
            SizedBox(
              height: 10.h,
            ),
            Container(width: 80.w, height: 10.h, color: Colors.white),
            SizedBox(
              height: 10.h,
            ),
            Container(width: 80.w, height: 10.h, color: Colors.white),
          ],
        ),
      ),
      itemCount: 6,
    ),
  );
}

// ignore: non_constant_identifier_names
Widget CategoriesShimmer() {
  return Shimmer.fromColors(
    baseColor: baseColor,
    highlightColor: highlightColor,
    child: ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        width: 10.w,
      ),
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, __) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: 105.w, height: 0.12.sh, color: Colors.white),
            SizedBox(
              height: 10.h,
            ),
            Container(width: 80.w, height: 10.h, color: Colors.white),
          ],
        ),
      ),
      itemCount: 6,
    ),
  );
}

// ignore: non_constant_identifier_names
Widget NewInShimmer() {
  return Shimmer.fromColors(
    baseColor: baseColor,
    highlightColor: highlightColor,
    child: ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        width: 10.w,
      ),
      itemBuilder: (_, __) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20.h,
                ),
                Container(
                    width: 105.w,
                    height: 0.12.sh,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10))),
                SizedBox(
                  width: 10.h,
                ),
                Column(
                  children: [
                    Container(width: 80.w, height: 10.h, color: Colors.white),
                    SizedBox(
                      width: 10.h,
                    ),
                    Container(width: 80.w, height: 10.h, color: Colors.white),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.0.w),
              child: Column(
                children: [
                  Container(width: 80.w, height: 10.h, color: Colors.white),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(width: 80.w, height: 10.h, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
      itemCount: 6,
    ),
  );
}

// ignore: non_constant_identifier_names
Widget CategoryLeftShimmer() {
  return Shimmer.fromColors(
    baseColor: baseColor,
    highlightColor: highlightColor,
    child: ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: 10.w,
      ),
      itemBuilder: (_, __) => Container(height: 150.h, color: Colors.white),
      itemCount: 6,
    ),
  );
}

// ignore: non_constant_identifier_names
Widget CategoryRightShimmer() {
  return Shimmer.fromColors(
    baseColor: baseColor,
    highlightColor: highlightColor,
    child: ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: 20.w,
      ),
      itemBuilder: (_, __) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 20.w,
          ),
          Container(
            height: 150.h,
            color: Colors.white,
            width: 10.w,
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.w,
              ),
              Container(
                width: 250.w,
                height: 10.h,
                color: Colors.white,
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 40.w,
                height: 10.h,
                color: Colors.white,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 60.w,
                        height: 10.h,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: 50.w,
                        height: 10.h,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: 80.w,
                        height: 30.h,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 50.h,
                  ),
                  Container(
                    width: 120.w,
                    height: 80.h,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      itemCount: 6,
    ),
  );
}
