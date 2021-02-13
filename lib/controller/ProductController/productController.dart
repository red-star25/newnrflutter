import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  int productQuantity = 100;

  ScrollController scrollController;
  TextEditingController quantityController;

  @override
  void onInit() {
    scrollController = ScrollController(keepScrollOffset: true);
    quantityController = TextEditingController();
    super.onInit();
  }
}
