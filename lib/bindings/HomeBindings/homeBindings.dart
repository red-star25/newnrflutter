import 'package:get/get.dart';
import 'package:nrlifecare/controller/HomeController/homeController.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
