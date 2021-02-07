import 'package:get/get.dart';
import 'package:nrlifecare/view/Authentication/Login.dart';
import 'package:nrlifecare/view/Authentication/Phone.dart';
import 'package:nrlifecare/view/Authentication/Register.dart';
import 'package:nrlifecare/view/Home/Home.dart';
import 'package:nrlifecare/view/Splash/Splash.dart';
import 'package:nrlifecare/bindings/AuthBindings/authBindings.dart';

class NrRouter {
  static List<GetPage> pages = [
    GetPage(name: '/', page: () => Splash()),
    GetPage(name: '/login', page: () => Login(), binding: AuthBindings()),
    GetPage(name: '/register', page: () => Register(), binding: AuthBindings()),
    GetPage(name: '/home', page: () => Home()),
    GetPage(name: '/phone', page: () => PhoneAuth(), binding: AuthBindings()),
  ];
}
