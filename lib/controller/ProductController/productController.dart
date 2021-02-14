import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/model/ProductModel/productModel.dart';

class ProductController extends GetxController {
  RxString productQuantity = "100".obs;

  ProductModel selectedProduct;
  int selectedIndex;

  ScrollController scrollController;
  TextEditingController quantityController;

  @override
  void onInit() {
    scrollController = ScrollController(keepScrollOffset: true);
    quantityController = TextEditingController();
    super.onInit();
  }
}
