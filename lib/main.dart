import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:get/get.dart';
import 'package:nrlifecare/bindings/AuthBindings/authBindings.dart';
import 'package:nrlifecare/bindings/CartBindings/cartBindings.dart';
import 'package:nrlifecare/bindings/CategoryBindings/categoryBindings.dart';
import 'package:nrlifecare/bindings/ProductBindings/productBindings.dart';
import 'package:nrlifecare/controller/AuthController/authcontroller.dart';
import 'package:nrlifecare/routes/router.dart';
import 'package:nrlifecare/view/PageNotFound/pagenotfound.dart';
import 'package:nrlifecare/view/Splash/OnBoardingScreen.dart';
import 'package:nrlifecare/view/Splash/Splash.dart';
import 'package:nrlifecare/bindings/HomeBindings/homeBindings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AuthBindings().dependencies();
  CartBindings().dependencies();
  HomeBindings().dependencies();
  CategoryBindings().dependencies();
  ProductBindings().dependencies();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale("en"), Locale("hi"), Locale("gu")],
      path: "assets/translations",
      fallbackLocale: const Locale("en"),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return ScreenUtilInit(
      designSize: const Size(480, 800),
      allowFontScaling: true,
      builder: () => GetMaterialApp(
        theme: ThemeData(fontFamily: "Roboto"),
        initialRoute: "/",
        unknownRoute: GetPage(name: "/notfound", page: () => PageNotFount()),
        getPages: NrRouter.pages,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: authController.isOnBoard.value == null ||
                  authController.isOnBoard.value == false
              ? OnBoardingScreen()
              : Splash(),
        ),
      ),
    );
  }
}
