import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/controller/CartController/cartController.dart';
import 'package:nrlifecare/data/fakeData.dart';
import 'package:nrlifecare/model/ProductModel/productModel.dart';

class CategoryController extends GetxController {
  final searchedProducts = RxList<ProductModel>().obs;

  // final productList = FakeData.productList;

  final categoryList = FakeData.categoryList.obs;

  RxBool isSearchVisible = false.obs;

  void updateIsSearchVisible({bool value}) {
    isSearchVisible = RxBool(value);
    update();
  }

  void addSearchedProducts(String term) {
    searchedProducts.value.clear();
    categoryList.value[selectedCategoryIndex.value].products.forEach((product) {
      if (product.productName.toLowerCase() == term.toLowerCase()) {
        searchedProducts.value.add(product);
        debugPrint(searchedProducts.toString());
      }
    });
    // productList.value.forEach((product) {
    //   if (product.productName.toLowerCase() == term.toLowerCase()) {
    //     searchedProducts.value.add(product);
    //     debugPrint(searchedProducts.toString());
    //   }
    // }
    // );
  }

  RxInt selectedCategoryIndex = 0.obs;

  void setSelectedCategory(int index) {
    for (int i = 0; i < categoryList.value.length; i++) {
      if (i == index) {
        categoryList.value[i].isSelected = true;
        selectedCategoryIndex.value = index;
        update();
      } else {
        categoryList.value[i].isSelected = false;
        update();
      }
    }
  }

  void updateProductQuantity({int quantity, int index}) {
    categoryList.update((product) {
      product[selectedCategoryIndex.value].products[index].productQuantity =
          quantity;
    });
    // productList.update((product) {
    //   product[index].productQuantity = quantity;
    // });
  }

  void addProductToCartToggle({int id}) {
    categoryList.update((product) {
      final filteredProduct = product[selectedCategoryIndex.value]
          .products
          .singleWhere((element) => element.id == id);
      if (filteredProduct.isAdded == false) {
        filteredProduct.isAdded = true;
        Get.find<CartController>().cartItems.value.add(filteredProduct);

        print("Added: ");
        print(Get.find<CartController>().cartItems);
        print("\n");
      } else {
        filteredProduct.isAdded = false;

        Get.find<CartController>()
            .cartItems
            .value
            .removeWhere((cartProduct) => cartProduct.id == filteredProduct.id);

        print("Removed");
        print(Get.find<CartController>().cartItems);
        print("\n");
      }
    });
  }

  // getSearchResults(String searchQuery) {
  //   productList.value.forEach((productDetail) {
  //     if (productDetail.values.contains(searchQuery)) searchList.add();
  //   });
  // }
}
