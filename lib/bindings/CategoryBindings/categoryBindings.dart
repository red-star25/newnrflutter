import 'package:get/get.dart';
import 'package:nrlifecare/controller/CategoryController/categoryController.dart';

class CategoryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryController());
  }
}
