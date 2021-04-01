import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/controller/HomeController/homeController.dart';
import 'package:nrlifecare/data/sharedPrefs/sharedPrefs.dart';
import 'package:nrlifecare/model/CategoryModel/categoryModel.dart';
import 'package:nrlifecare/model/ProductModel/productModel.dart';

class CategoryController extends GetxController {
  List<ProductModel> searchedProducts = [];
  RxString categoryId = RxString();

  List<CategoryModel> categoryList;
  List<ProductModel> productList;

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

  List<CategoryModel> categories(QuerySnapshot snapshot) {
    categoryList =
        snapshot.docs.map((e) => CategoryModel.fromJson(e.data())).toList();
    return categoryList;
  }

  Stream<List<CategoryModel>> getCategories() {
    final firebaseFirestore =
        FirebaseFirestore.instance.collection("Categories");
    return firebaseFirestore.snapshots().map(categories);
  }

  List<ProductModel> categoryProduct(QuerySnapshot snapshot) {
    productList =
        snapshot.docs.map((e) => ProductModel.fromJson(e.data())).toList();
    return productList;
  }

  Stream<List<ProductModel>> getcategoryProduct() {
    final firebaseFirestore = FirebaseFirestore.instance
        .collection("Categories")
        .doc(categoryId.value)
        .collection("products");
    return firebaseFirestore.snapshots().map(categoryProduct);
  }

  Future<bool> onBackPress() {
    Get.offAllNamed("/home");
    Get.find<HomeController>().updateSelectedFabIcon(1);
    return Future.value(true);
  }

  Future<void> addSearchedProducts(String term) async {
    try {
      for (var i = 0; i < productList.length; i++) {
        if (productList[i]
            .productName
            .toLowerCase()
            .contains(term.toLowerCase())) {
          searchedProducts.add(productList[i]);

          break;
        }
      }
      update();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  RxInt selectedCategoryIndex = 0.obs;
  void setSelectedCategory(int index) {
    for (int i = 0; i < categoryList.length; i++) {
      if (i == index) {
        categoryList[i].isSelected = true;
        selectedCategoryIndex.value = index;
        update();
      } else {
        categoryList[i].isSelected = false;
        update();
      }
    }
  }

  Future<void> addProductToCartToggle({String id, int index}) async {
    if (index != null) {
      if (searchedProducts[index].isAdded == false) {
        searchedProducts[index].isAdded = true;
        update();
      } else {
        searchedProducts[index].isAdded = false;
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
