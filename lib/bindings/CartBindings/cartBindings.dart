import 'package:get/get.dart';
import 'package:nrlifecare/controller/CartController/cartController.dart';

class CartBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<CartController>(CartController());
  }
}
