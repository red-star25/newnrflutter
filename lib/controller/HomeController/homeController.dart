import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/controller/CartController/cartController.dart';
import 'package:nrlifecare/data/fakeData.dart';
import 'package:nrlifecare/data/sharedPrefs/sharedPrefs.dart';

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

  Future<void> addProductToCartToggle({String id}) async {
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
            .then((value) => value.data());

        await collectionReference.doc(id).set(addedProductData);
      });
    } else {
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
            .delete();
      });
    }
  }

  void addNewInProductToCart({String id}) async {
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
            .then((value) => value.data());

        await collectionReference.doc(id).set(addedProductData);
      });
    } else {
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
            .delete();
      });
    }
  }
}
