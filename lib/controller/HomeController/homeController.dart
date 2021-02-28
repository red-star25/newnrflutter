import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/controller/CartController/cartController.dart';
import 'package:nrlifecare/data/fakeData.dart';
import 'package:nrlifecare/data/sharedPrefs/sharedPrefs.dart';
import 'dart:math';

class HomeController extends GetxController {
  ScrollController scrollController;
  RxInt selectedFabIcon = 1.obs;
  final topProducts = FakeData.topProducts;
  final newInProducts = FakeData.newInProducts;
  RxBool isLoggedIn = false.obs;
  bool isAddingToCart = false;
  final random = Random();

  final languageSettings = {"EN": true, "HI": false, "GU": false}.obs;
  final selectedLanguage = "English".obs;

  void setLanguage(String languageId) {
    switch (languageId) {
      case "EN":
        languageSettings["EN"] = true;
        languageSettings["HI"] = false;
        languageSettings["GU"] = false;
        selectedLanguage.value = "English";
        Get.back();
        break;
      case "HI":
        languageSettings["EN"] = false;
        languageSettings["HI"] = true;
        languageSettings["GU"] = false;
        selectedLanguage.value = "Hindi";
        Get.back();
        break;
      case "GU":
        languageSettings["EN"] = false;
        languageSettings["HI"] = false;
        languageSettings["GU"] = true;
        selectedLanguage.value = "Gujarati";
        Get.back();
        break;
      default:
        languageSettings["EN"] = true;
        languageSettings["HI"] = false;
        languageSettings["GU"] = false;
        selectedLanguage.value = "English";
        Get.back();
    }
  }

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

  Future<void> addProductToCartToggle({String id}) async {
    isAddingToCart = true;
    update();
    final isAlreadyAdded = await FirebaseFirestore.instance
        .collection("TopProducts")
        .doc(id)
        .get()
        .then((value) => value.data()["isAdded"] as bool);

    if (!isAlreadyAdded) {
      await FirebaseFirestore.instance
          .collection("TopProducts")
          .doc(id)
          .update({"isAdded": true}).then((value) async {
        final uId = await SharedPrefs.getUid();

        CollectionReference collectionReference = FirebaseFirestore.instance
            .collection("Users")
            .doc(uId)
            .collection("cartProducts");

        Map<String, dynamic> addedProductData = await FirebaseFirestore.instance
            .collection("TopProducts")
            .doc(id)
            .get()
            .then((value) => {
                  "id": value.data()["id"],
                  "productName": value.data()["productName"],
                  "productImage": value.data()["productImage"],
                  "productPrice": value.data()["productPrice"],
                  "productSize": value.data()["productSize"],
                  "isAdded": value.data()["isAdded"],
                  "categoryName": "TopProducts",
                  "categoryId": null
                });

        await collectionReference.doc(id).set(addedProductData);
        await collectionReference.doc(id).update({"userQuantity": "1"});
        isAddingToCart = false;
        update();
      });
    } else {
      isAddingToCart = true;
      update();
      await FirebaseFirestore.instance
          .collection("TopProducts")
          .doc(id)
          .update({"isAdded": false}).then((value) async {
        final uId = await SharedPrefs.getUid();

        await FirebaseFirestore.instance
            .collection("Users")
            .doc(uId)
            .collection("cartProducts")
            .doc(id)
            .delete()
            .then((value) async {
          await FirebaseFirestore.instance
              .collection("TopProducts")
              .doc(id)
              .update({"isAdded": false}).then((value) {
            isAddingToCart = false;
            update();
          });
        });
      });
    }
  }

  void addNewInProductToCart({String id}) async {
    isAddingToCart = true;
    update();
    final isAlreadyAdded = await FirebaseFirestore.instance
        .collection("NewProducts")
        .doc(id)
        .get()
        .then((value) => value.data()["isAdded"] as bool);

    if (!isAlreadyAdded) {
      await FirebaseFirestore.instance
          .collection("NewProducts")
          .doc(id)
          .update({"isAdded": true}).then((value) async {
        final uId = await SharedPrefs.getUid();

        CollectionReference collectionReference = FirebaseFirestore.instance
            .collection("Users")
            .doc(uId)
            .collection("cartProducts");

        Map<String, dynamic> addedProductData = await FirebaseFirestore.instance
            .collection("NewProducts")
            .doc(id)
            .get()
            .then((value) => {
                  "id": value.data()["id"],
                  "productName": value.data()["productName"],
                  "productImage": value.data()["productImage"],
                  "productPrice": value.data()["productPrice"],
                  "productSize": value.data()["productSize"],
                  "categoryName": "NewProducts",
                  "categoryId": null
                });

        await collectionReference.doc(id).set(addedProductData);
        await collectionReference.doc(id).update({"userQuantity": "1"});
        isAddingToCart = false;
        update();
      });
    } else {
      isAddingToCart = true;
      update();
      await FirebaseFirestore.instance
          .collection("NewProducts")
          .doc(id)
          .update({"isAdded": false}).then((value) async {
        final uId = await SharedPrefs.getUid();

        await FirebaseFirestore.instance
            .collection("Users")
            .doc(uId)
            .collection("cartProducts")
            .doc(id)
            .delete()
            .then((value) async {
          await FirebaseFirestore.instance
              .collection("NewProducts")
              .doc(id)
              .update({"isAdded": false}).then((value) {
            isAddingToCart = false;
            update();
          });
        });
      });
    }
  }
}
