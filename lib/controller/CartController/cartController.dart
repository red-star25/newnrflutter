import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/model/ProductModel/productModel.dart';

class CartController extends GetxController {
  List<ProductModel> cartItems;
  double totalCartPrice = 0.0;

  @override
  void onInit() {
    // TODO: implement onInit
    cartItems = [];
    super.onInit();
  }

  void deleteCartProduct(int index) {
    cartItems[index].isAdded = false;
    cartItems.removeAt(index);
    update();
  }

  void updateProductQuantity(int index, String type, {int newQuantity}) {
    switch (type) {
      case "INCREMENT":
        cartItems[index].productQuantity++;
        update();
        break;

      case "DECREMENT":
        if (int.parse(cartItems[index].productQuantity.toString()) > 1) {
          cartItems[index].productQuantity--;
          update();
        } else {
          cartItems[index].productQuantity = 1;
          update();
        }
        break;

      case "NEWQUANTITY":
        cartItems[index].productQuantity = newQuantity;
        update();
        break;
      default:
    }
  }

  double totalCartProductPrice() {
    totalCartPrice = 0.0;
    for (ProductModel product in cartItems) {
      totalCartPrice = totalCartPrice +
          (double.parse(product.productQuantity.toString()) *
              double.parse(product.productPrice.toString()));
    }
    return totalCartPrice;
  }
}
