import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/controller/CartController/cartController.dart';
import 'package:nrlifecare/model/ProductModel/productModel.dart';

class CategoryController extends GetxController {
  List<Map> categoryList;
  List<ProductModel> productList;
  List<ProductModel> searchList;

  bool isSearchVisible = false;

  CartController cartController;
  @override
  void onInit() {
    cartController = Get.put(CartController());
    searchList = [];
    productList = [
      ProductModel.fromJson({
        "id": 111,
        "product_image": "assets/images/test_product.png",
        "product_name": "NRCOF-TR",
        "product_size": "60ml",
        "product_price": 45.00,
        "product_quantity": 1,
        "is_added": false
      }),
      ProductModel.fromJson({
        "id": 222,
        "product_image": "assets/images/test_product.png",
        "product_name": "NRMet",
        "product_size": "60ml",
        "product_price": 45.00,
        "product_quantity": 2,
        "is_added": false
      }),
      ProductModel.fromJson({
        "id": 333,
        "product_image": "assets/images/test_product.png",
        "product_name": "NRPro",
        "product_size": "60ml",
        "product_price": 45.00,
        "product_quantity": 3,
        "is_added": false
      }),
      ProductModel.fromJson({
        "id": 444,
        "product_image": "assets/images/test_product.png",
        "product_name": "NRAnti",
        "product_size": "60ml",
        "product_price": 45.00,
        "product_quantity": 4,
        "is_added": false
      }),
      ProductModel.fromJson({
        "id": 555,
        "product_image": "assets/images/test_product.png",
        "product_name": "NRSyrup",
        "product_size": "60ml",
        "product_price": 45.00,
        "product_quantity": 5,
        "is_added": false
      }),
    ];
    categoryList = [
      {"name": "Antibiotics", "isSelected": true},
      {"name": "Cough & Cold", "isSelected": false},
      {"name": "Analgesic", "isSelected": false},
      {"name": "Nutritional & Nutraceuticals", "isSelected": false},
      {"name": "Gastrointestinal", "isSelected": false},
      {"name": "Antimenetic", "isSelected": false},
      {"name": "Pesticides", "isSelected": false},
    ];
    super.onInit();
  }

  void updateIsSearchVisible({bool value}) {
    isSearchVisible = value;
    update();
  }

  void setSelectedCategory(int index) {
    for (int i = 0; i < categoryList.length; i++) {
      if (i == index) {
        categoryList[i]["isSelected"] = true;
        update();
      } else {
        categoryList[i]["isSelected"] = false;
        update();
      }
    }
  }

  void updateProductQuantity({int quantity, int index}) {
    productList[index].productQuantity = quantity;
    update();
  }

  void addProductToCartToggle({int index}) {
    if (productList[index].isAdded == false) {
      productList[index].isAdded = true;
      cartController.cartItems.add(productList[index]);
      update();

      print("Added: ");
      print(cartController.cartItems);
      print("\n");
    } else {
      productList[index].isAdded = false;

      cartController.cartItems
          .removeWhere((product) => product.id == productList[index].id);
      update();

      print("Removed");
      print(cartController.cartItems);
      print("\n");
    }
  }

  getSearchResults(String query) {
    productList.forEach((product) {
      if (product.productName.contains(query)) searchList.add(product);
    });
    update();
  }

  // getSearchResults(String searchQuery) {
  //   productList.value.forEach((productDetail) {
  //     if (productDetail.values.contains(searchQuery)) searchList.add();
  //   });
  // }
}
