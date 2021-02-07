import 'package:get/get.dart';
import 'package:nrlifecare/controller/AuthController/authcontroller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
  }
}
