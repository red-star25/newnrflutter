import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/controller/HomeController/homeController.dart';
import 'package:nrlifecare/data/fakeData.dart';
import 'package:nrlifecare/data/sharedPrefs/sharedPrefs.dart';

class CategoryController extends GetxController {
  final searchedProducts = RxList<Map<String, dynamic>>().obs;

  // final productList = FakeData.productList;

  RxString categoryId = RxString();

  final categoryList = FakeData.categoryList.obs;

  RxBool isSearchVisible = false.obs;

  bool isAddedToCart = false;

  void updateIsSearchVisible({bool value}) {
    isSearchVisible = RxBool(value);
    update();
  }

  void setCategoryId(String id) {
    categoryId.value = id;
    update();
  }

  Future<bool> onBackPress() {
    Get.offAllNamed("/home");
    Get.find<HomeController>().updateSelectedFabIcon(1);
    return Future.value(true);
  }

  Future<void> addSearchedProducts(String term) async {
    searchedProducts.value.clear();
    try {
      await FirebaseFirestore.instance
          .collection("Categories")
          .doc(categoryId.toString())
          .collection("products")
          .get()
          .then((value) {
        for (var i = 0; i < value.docs.length; i++) {
          if (value.docs[i]
              .data()["productName"]
              .toString()
              .toLowerCase()
              .contains(term.toLowerCase())) {
            searchedProducts.value.add(value.docs[i].data());
            break;
          }
        }
        update();
      });
    } catch (e) {
      debugPrint(e.toString());
    }
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

  Future<void> addProductToCartToggle({String id, int index}) async {
    if (index != null) {
      if (searchedProducts.value[index]["isAdded"] == false) {
        searchedProducts.value[index]["isAdded"] = true;
        update();
      } else {
        searchedProducts.value[index]["isAdded"] = false;
        update();
      }
    }

    final isAlreadyAdded = await FirebaseFirestore.instance
        .collection("Categories")
        .doc(categoryId.value.toString())
        .collection("products")
        .doc(id)
        .get()
        .then((value) => value.data()["isAdded"] as bool);

    if (!isAlreadyAdded) {
      try {
        isAddedToCart = true;
        update();
        await FirebaseFirestore.instance
            .collection("Categories")
            .doc(categoryId.value.toString())
            .collection("products")
            .doc(id)
            .update({"isAdded": true}).then((value) async {
          final uId = await SharedPrefs.getUid();

          final collectionReference = FirebaseFirestore.instance
              .collection("Users")
              .doc(uId)
              .collection("cartProducts");

          final addedProductData = await FirebaseFirestore.instance
              .collection("Categories")
              .doc(categoryId.value.toString())
              .collection("products")
              .doc(id)
              .get()
              .then((value) => value.data());

          await collectionReference.doc(id).set(addedProductData);
          await collectionReference.doc(id).update({
            "categoryId": categoryId.value,
            "userQuantity": "1"
          }).then((value) {
            isAddedToCart = false;
            update();
          });
        });
      } catch (e) {
        isAddedToCart = false;
        update();
      }
    } else {
      try {
        isAddedToCart = true;
        update();
        await FirebaseFirestore.instance
            .collection("Categories")
            .doc(categoryId.value.toString())
            .collection("products")
            .doc(id)
            .update({"isAdded": false}).then((value) async {
          final uId = await SharedPrefs.getUid();

          await FirebaseFirestore.instance
              .collection("Users")
              .doc(uId)
              .collection("cartProducts")
              .doc(id)
              .delete()
              .then((value) {
            isAddedToCart = false;
            update();
          });
        });
      } catch (e) {
        isAddedToCart = false;
        update();
      }
    }
  }
}
