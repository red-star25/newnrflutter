import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nrlifecare/controller/ProductController/productController.dart';
import 'package:nrlifecare/view/Product/ProductBottom.dart';
import 'package:nrlifecare/view/Product/ProductTop.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();
    return SafeArea(
      child: Obx(
        () => Scaffold(
          backgroundColor: productController.imgBgColor.value,
          body: NestedScrollView(
            controller: productController.scrollController,
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
                    expandedHeight: 0.45.sh,
                    titleSpacing: 0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: AnimatedContainer(
                        // color: Colors.lightBlue,
                        duration: const Duration(milliseconds: 200),
                        child: ProductTop(),
                      ),
                    ),
                  ),
                ),
              )
            ],
            body: ProductBottom(),
          ),
        ),
      ),
    );
  }
}
