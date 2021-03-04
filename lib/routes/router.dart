import 'package:get/get.dart';
import 'package:nrlifecare/bindings/CartBindings/cartBindings.dart';
import 'package:nrlifecare/bindings/ProductBindings/productBindings.dart';
import 'package:nrlifecare/view/AboutUs/AboutUs.dart';
import 'package:nrlifecare/view/Authentication/Login.dart';
import 'package:nrlifecare/view/Authentication/Phone.dart';
import 'package:nrlifecare/view/Authentication/Register.dart';
import 'package:nrlifecare/view/Cart/Cart.dart';
import 'package:nrlifecare/view/ContactUs/ContactUs.dart';
import 'package:nrlifecare/view/Home/Home.dart';
import 'package:nrlifecare/view/Category/Category.dart';
import 'package:nrlifecare/view/Product/Product.dart';
import 'package:nrlifecare/view/SearchProduct/searchPage.dart';
import 'package:nrlifecare/view/Splash/Splash.dart';
import 'package:nrlifecare/bindings/AuthBindings/authBindings.dart';
import 'package:nrlifecare/view/UserProfile/userProfile.dart';
import 'package:nrlifecare/view/Cart/cashOnDelivery.dart';

// ignore: avoid_classes_with_only_static_members
class NrRouter {
  static List<GetPage> pages = [
    GetPage(name: '/', page: () => Splash()),
    GetPage(name: '/login', page: () => Login(), binding: AuthBindings()),
    GetPage(name: '/register', page: () => Register(), binding: AuthBindings()),
    GetPage(name: '/home', page: () => Home()),
    GetPage(name: '/phone', page: () => PhoneAuth(), binding: AuthBindings()),
    GetPage(
        name: '/product', page: () => Product(), binding: ProductBindings()),
    GetPage(name: '/category', page: () => NrCategory()),
    GetPage(name: '/cart', page: () => Cart(), binding: CartBindings()),
    GetPage(name: '/aboutUs', page: () => AboutUs()),
    GetPage(name: '/contactUs', page: () => ContactUs()),
    GetPage(
      name: '/searchPage',
      page: () => SearchPage(),
    ),
    GetPage(
      name: '/userProfile',
      page: () => UserProfile(),
    ),
    GetPage(
      name: '/cashOnDelivery',
      page: () => CashOnDelivery(),
    ),
  ];
}
