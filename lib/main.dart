import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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

import 'constants/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
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

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

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
        home: Obx(() => Scaffold(
              body: !authController.isConnecting.value
                  ? authController.isConnected
                      ? authController.isOnBoard.value == null ||
                              authController.isOnBoard.value == false
                          ? OnBoardingScreen()
                          : Splash()
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "No Internet 😕",
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Please connect your device to the Internet",
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        )
                  : Center(
                      child: SpinKitRipple(
                        color: AppColors.primaryColor,
                      ),
                    ),
            )),
      ),
    );
  }
}
