import 'package:get/get.dart';
import 'package:nrlifecare/bindings/CartBindings/cartBindings.dart';
import 'package:nrlifecare/bindings/CategoryBindings/categoryBindings.dart';
import 'package:nrlifecare/bindings/ProductBindings/productBindings.dart';
import 'package:nrlifecare/view/AboutUs/AboutUs.dart';
import 'package:nrlifecare/view/Authentication/Login.dart';
import 'package:nrlifecare/view/Authentication/Phone.dart';
import 'package:nrlifecare/view/Authentication/Register.dart';
import 'package:nrlifecare/view/Cart/Cart.dart';
import 'package:nrlifecare/view/Cart/OrderSuccess.dart';
import 'package:nrlifecare/view/ContactUs/ContactUs.dart';
import 'package:nrlifecare/view/Home/Home.dart';
import 'package:nrlifecare/view/Category/Category.dart';
import 'package:nrlifecare/view/Product/Product.dart';
import 'package:nrlifecare/view/SearchProduct/searchPage.dart';
import 'package:nrlifecare/view/Splash/Splash.dart';
import 'package:nrlifecare/bindings/AuthBindings/authBindings.dart';
import 'package:nrlifecare/view/UserProfile/userProfile.dart';
import 'package:nrlifecare/view/Cart/paymentDetails.dart';

// ignore: avoid_classes_with_only_static_members
class NrRouter {
  static List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => Splash(),
    ),
    GetPage(
      name: '/login',
      page: () => Login(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 400),
      binding: AuthBindings(),
    ),
    GetPage(
      name: '/register',
      page: () => Register(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 400),
      binding: AuthBindings(),
    ),
    GetPage(
      name: '/phone',
      page: () => PhoneAuth(),
      binding: AuthBindings(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: '/home',
      page: () => Home(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
        name: '/product',
        page: () => Product(),
        binding: ProductBindings(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 400)),
    GetPage(
      name: '/category',
      page: () => NrCategory(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 400),
      binding: CategoryBindings(),
    ),
    GetPage(
      name: '/cart',
      page: () => Cart(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 400),
      binding: CartBindings(),
    ),
    GetPage(
      name: '/aboutUs',
      page: () => AboutUs(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: '/contactUs',
      page: () => ContactUs(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: '/searchPage',
      page: () => SearchPage(),
    ),
    GetPage(
      name: '/userProfile',
      page: () => UserProfile(),
      transition: Transition.upToDown,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: '/paymentDetails',
      page: () => PaymentDetails(),
      transition: Transition.upToDown,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: '/orderSuccess',
      page: () => OrderSuccess(),
      transition: Transition.upToDown,
      transitionDuration: const Duration(milliseconds: 400),
    ),
  ];
}
