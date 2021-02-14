import 'package:get/get.dart';
import 'package:nrlifecare/controller/ProductController/productController.dart';

class ProductBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ProductController>(ProductController());
  }
}
