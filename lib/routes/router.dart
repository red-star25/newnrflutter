import 'package:nrlifecare/view/Authentication/Login.dart';
import 'package:nrlifecare/view/Authentication/Register.dart';
import 'package:nrlifecare/view/Splash/Splash.dart';
import 'package:auto_route/auto_route_annotations.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: Splash, initial: true),
  AutoRoute(page: Login),
  AutoRoute(page: Register)
])
class $NRRouter {}
