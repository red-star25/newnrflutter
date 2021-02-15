import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/model/ProductModel/productModel.dart';

class CartController extends GetxController {
  final cartItems = RxList<ProductModel>().obs;
  double totalCartPrice = 0.0;

  void deleteCartProduct(int index) {
    cartItems.value[index].isAdded = false;
    cartItems.value.removeAt(index);
    update();
  }

  void updateProductQuantity(int index, String type, {int newQuantity}) {
    switch (type) {
      case "INCREMENT":
        cartItems.value[index].minimumOrder++;
        update();
        break;

      case "DECREMENT":
        if (int.parse(cartItems.value[index].minimumOrder.toString()) > 1) {
          cartItems.value[index].minimumOrder--;
          update();
        } else {
          cartItems.value[index].minimumOrder = 1;
          update();
        }
        break;

      case "NEWQUANTITY":
        cartItems.value[index].minimumOrder = newQuantity;
        update();
        break;
      default:
    }
  }

  double totalCartProductPrice() {
    totalCartPrice = 0.0;
    for (ProductModel product in cartItems.value) {
      totalCartPrice = totalCartPrice +
          (double.parse(product.minimumOrder.toString()) *
              double.parse(product.productPrice.toString()));
    }
    return totalCartPrice;
  }
}
