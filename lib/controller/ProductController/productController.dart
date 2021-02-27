import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/model/ProductModel/productModel.dart';

class ProductController extends GetxController {
  Map<String, dynamic> selectedProduct;
  RxInt selectedIndex = 0.obs;

  ScrollController scrollController;
  TextEditingController quantityController;

  @override
  void onInit() {
    scrollController = ScrollController(keepScrollOffset: true);
    super.onInit();
  }
}
