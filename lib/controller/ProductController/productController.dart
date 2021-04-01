import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/model/ProductModel/productModel.dart';

class ProductController extends GetxController {
  ProductModel selectedProduct;
  RxInt selectedIndex = 0.obs;
  final imgBgColor = const Color(0xffffffff).obs;
  final heroTag = "".obs;

  ScrollController scrollController;
  TextEditingController quantityController;

  @override
  void onInit() {
    scrollController = ScrollController();
    super.onInit();
  }
}
