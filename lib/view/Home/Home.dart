import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/controller/HomeController/homeController.dart';
import 'package:nrlifecare/wigdets/CustomSnackbar/customWidgets.dart';
import 'package:nrlifecare/wigdets/HomeWidgets/Categories.dart';
import 'package:nrlifecare/wigdets/HomeWidgets/CustomAppBar.dart';
import 'package:nrlifecare/wigdets/HomeWidgets/NewIn.dart';
import 'package:nrlifecare/wigdets/HomeWidgets/TopProducts.dart';
import 'package:nrlifecare/wigdets/HomeWidgets/FloatingButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () => homeController.exitApp(),
        child: Scaffold(
          floatingActionButton: FloatingButton(),
          body: NestedScrollView(
            controller: homeController.scrollController,
            headerSliverBuilder: (context, innerBoxIsScroller) => [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverSafeArea(
                  top: false,
                  sliver: SliverAppBar(
                    leading: Container(),
                    floating: true,
                    backgroundColor: Colors.transparent,
                    expandedHeight: 0.82.sh,
                    titleSpacing: 0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: AnimatedContainer(
                        // color: Colors.lightBlue,
                        duration: const Duration(milliseconds: 200),
                        child: Column(
                          children: [
                            CustomAppBar(),
                            SizedBox(
                              height: 25.h,
                            ),
                            TopProducts(),
                            SizedBox(
                              height: 25.h,
                            ),
                            Categories(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
            body: NewIn(),
          ),
        ),
      ),
    );
  }
}
