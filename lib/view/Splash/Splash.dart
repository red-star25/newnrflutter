import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/controller/HomeController/homeController.dart';
import 'package:nrlifecare/view/Authentication/Login.dart';
import 'package:nrlifecare/view/Home/Home.dart';

class Splash extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homeController.isLoggedIn.value == null ||
              homeController.isLoggedIn.value == false
          ? Login()
          : Home(),
    );
  }
}
