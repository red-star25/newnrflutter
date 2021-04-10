import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/controller/CartController/cartController.dart';
// import 'package:nrlifecare/data/fakeData.dart';
import 'package:nrlifecare/data/sharedPrefs/sharedPrefs.dart';
import 'package:nrlifecare/model/ProductModel/productModel.dart';

class HomeController extends GetxController {
  ScrollController scrollController;
  RxInt selectedFabIcon = 1.obs;
  RxBool isLoggedIn = false.obs;
  bool isAddingToCart = false;
  final random = Random();
  final selectedLanguage = "".obs;

  Locale locale;

  Future<void> setLanguage(String languageId) async {
    switch (languageId) {
      case "EN":
        selectedLanguage.value = "English";
        await SharedPrefs.setPrefsLocale(locale: "English");
        break;
      case "HI":
        selectedLanguage.value = "Hindi";
        await SharedPrefs.setPrefsLocale(locale: "Hindi");
        break;
      case "GU":
        selectedLanguage.value = "Gujarati";
        await SharedPrefs.setPrefsLocale(locale: "Gujarati");
        break;
      default:
        selectedLanguage.value = "English";
        await SharedPrefs.setPrefsLocale(locale: "English");
    }
  }

  Future<bool> exitApp() {
    exit(0);
  }

  void get selectedFabIconIndex => selectedFabIcon;

  void updateSelectedFabIcon(int value) {
    selectedFabIcon = RxInt(value);
  }

  final cartController = Get.find<CartController>();

  @override
  void onInit() {
    getLocale();
    scrollController = ScrollController();
    getIsLoggedInState();
    super.onInit();
  }

  Future<void> getLocale() async {
    selectedLanguage.value = await SharedPrefs.getLocale() ?? "English";
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
      try {
        await FirebaseFirestore.instance
            .collection("TopProducts")
            .doc(id)
            .update({"isAdded": true}).then((value) async {
          final uId = await SharedPrefs.getUid();

          final collectionReference = FirebaseFirestore.instance
              .collection("Users")
              .doc(uId)
              .collection("cartProducts");

          final addedProductData = await FirebaseFirestore.instance
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
      } catch (e) {
        debugPrint(e.toString());
      }
    } else {
      isAddingToCart = true;
      update();
      try {
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
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  Future<void> addNewInProductToCart({String id}) async {
    isAddingToCart = true;
    update();
    final isAlreadyAdded = await FirebaseFirestore.instance
        .collection("NewProducts")
        .doc(id)
        .get()
        .then((value) => value.data()["isAdded"] as bool);

    if (!isAlreadyAdded) {
      try {
        await FirebaseFirestore.instance
            .collection("NewProducts")
            .doc(id)
            .update({"isAdded": true}).then((value) async {
          final uId = await SharedPrefs.getUid();

          final collectionReference = FirebaseFirestore.instance
              .collection("Users")
              .doc(uId)
              .collection("cartProducts");

          final addedProductData = await FirebaseFirestore.instance
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
      } catch (e) {
        debugPrint(e.toString());
      }
    } else {
      isAddingToCart = true;
      update();
      try {
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
      } catch (e) {
        print(e.toString());
      }
    }
  }

  List<ProductModel> products(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) => ProductModel.fromJson(e.data())).toList();
  }

  Stream<List<ProductModel>> getProducts(String categoryName) {
    final firebaseFirestore =
        FirebaseFirestore.instance.collection(categoryName);
    return firebaseFirestore.snapshots().map(products);
  }
}
