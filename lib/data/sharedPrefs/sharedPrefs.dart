import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static String IS_LOGGEDIN = "IS_LOGGEDIN";

  static Future<void> setIsLoggedIn({bool isLoggedIn}) async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.setBool(IS_LOGGEDIN, isLoggedIn);
  }

  static Future<bool> getIsLoggedIn() async {
    final _prefs = await SharedPreferences.getInstance();
    final isLoggedIn = _prefs.getBool(IS_LOGGEDIN);
    return isLoggedIn;
  }
}
