import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  Map<String, dynamic> selectedProduct;
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
