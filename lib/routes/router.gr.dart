// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';

import '../view/Authentication/Login.dart';
import '../view/Authentication/Register.dart';
import '../view/Splash/Splash.dart';

class Routes {
  static const String splash = '/';
  static const String login = '/Login';
  static const String register = '/Register';
  static const all = <String>{
    splash,
    login,
    register,
  };
}

class NRRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splash, page: Splash),
    RouteDef(Routes.login, page: Login),
    RouteDef(Routes.register, page: Register),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    Splash: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => Splash(),
        settings: data,
      );
    },
    Login: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => Login(),
        settings: data,
      );
    },
    Register: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => Register(),
        settings: data,
      );
    },
  };
}
