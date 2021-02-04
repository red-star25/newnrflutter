import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nrlifecare/routes/router.gr.dart';
import 'package:nrlifecare/view/Splash/Splash.dart';

void main() {
  runApp(
    EasyLocalization(
      child: MainApp(),
      supportedLocales: [Locale("en", "IN")],
      path: "assets/translations",
      fallbackLocale: Locale("en"),
    ),
  );
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: ExtendedNavigator.builder(
        router: NRRouter(),
        initialRoute: Routes.splash,
        builder: (_, navigator) => Theme(
          data: ThemeData.dark(),
          child: navigator,
        ),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Splash(),
      ),
    );
  }
}
