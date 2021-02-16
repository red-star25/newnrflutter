import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/controller/CartController/cartController.dart';
import 'package:nrlifecare/data/fakeData.dart';
import 'package:nrlifecare/data/sharedPrefs/sharedPrefs.dart';
import 'package:nrlifecare/model/ProductModel/productModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  ScrollController scrollController;
  RxInt selectedFabIcon = 1.obs;
  final topProducts = FakeData.topProducts;
  final newInProducts = FakeData.newInProducts;
  RxBool isLoggedIn = false.obs;

  get selectedFabIconIndex => selectedFabIcon;

  updateSelectedFabIcon(int value) {
    selectedFabIcon = RxInt(value);
    // update();
  }

  final cartController = Get.find<CartController>();

  @override
  void onInit() {
    scrollController = ScrollController();
    getIsLoggedInState();
    super.onInit();
  }

  Future<void> getIsLoggedInState() async {
    isLoggedIn.value = await SharedPrefs.getIsLoggedIn();
  }

  void addProductToCartToggle({int id}) {
    topProducts.update((product) {
      final filteredProduct =
          product.singleWhere((element) => element.id == id);
      if (filteredProduct.isAdded == false) {
        filteredProduct.isAdded = true;
        cartController.cartItems.value.add(filteredProduct);

        print("Added: ");
        print(Get.find<CartController>().cartItems);
        print("\n");
      } else {
        filteredProduct.isAdded = false;

        cartController.cartItems.value
            .removeWhere((cartProduct) => cartProduct.id == filteredProduct.id);

        print("Removed");
        print(Get.find<CartController>().cartItems);
        print("\n");
      }
    });
  }

  void addNewInProductToCart({int id}) {
    newInProducts.update((product) {
      final filteredProduct =
          product.singleWhere((element) => element.id == id);
      if (filteredProduct.isAdded == false) {
        filteredProduct.isAdded = true;
        cartController.cartItems.value.add(filteredProduct);

        print("Added: ");
        print(Get.find<CartController>().cartItems);
        print("\n");
      } else {
        filteredProduct.isAdded = false;

        cartController.cartItems.value
            .removeWhere((cartProduct) => cartProduct.id == filteredProduct.id);

        print("Removed");
        print(Get.find<CartController>().cartItems);
        print("\n");
      }
    });
  }
}
