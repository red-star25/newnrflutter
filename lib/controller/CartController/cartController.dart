import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/data/sharedPrefs/sharedPrefs.dart';

class CartController extends GetxController {
  List<Map<String, dynamic>> cartItems = [];
  double totalCartPrice = 0.0;
  TextEditingController quantityController;

  String uId;

  @override
  void onInit() {
    quantityController = TextEditingController(text: "1");
    getCartProducts();
    super.onInit();
  }

  Future<void> getUid() async {
    uId = await SharedPrefs.getUid();
  }

  Future<void> setUserQuantity({String pId, String quantity}) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(uId)
        .collection("cartProducts")
        .doc(pId)
        .update({"userQuantity": quantity}).then(
            (value) => totalCartProductPrice());
  }

  Future<void> getCartProducts() async {
    cartItems.clear();
    getUid();
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(uId)
        .collection("cartProducts")
        .get()
        .then((value) {
      for (var i = 0; i < value.docs.length; i++) {
        cartItems.add(value.docs[i].data());
      }
      update();
    });
  }

  void deleteCartProduct(
      {String id, String categoryId, String categoryName}) async {
    if (categoryId == null) {
      if (categoryName == "TopProducts") {
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
              .update({"isAdded": false}).then(
                  (value) => totalCartProductPrice());
        });
      } else if (categoryName == "NewProducts") {
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
              .update({"isAdded": false});
        }).then((value) => totalCartProductPrice());
      }
    } else {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(uId)
          .collection("cartProducts")
          .doc(id)
          .delete()
          .then((value) async {
        await FirebaseFirestore.instance
            .collection("Categories")
            .doc(categoryId)
            .collection("products")
            .doc(id)
            .update({"isAdded": false}).then(
                (value) => totalCartProductPrice());
      });
    }
    update();
  }

  Future<void> totalCartProductPrice() async {
    totalCartPrice = 0.0;
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(uId)
        .collection("cartProducts")
        .get()
        .then((value) {
      for (var i = 0; i < value.docs.length; i++) {
        totalCartPrice = totalCartPrice +
            (double.parse(value.docs[i]["userQuantity"].toString()) *
                (double.parse(value.docs[i]["productPrice"].toString())));
      }
    });
    update();
  }
}
