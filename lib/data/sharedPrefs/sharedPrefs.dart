import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static String IS_LOGGEDIN = "IS_LOGGEDIN";
  static String UID = "UID";

  static Future<void> setIsLoggedIn({bool isLoggedIn}) async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.setBool(IS_LOGGEDIN, isLoggedIn);
  }

  static Future<bool> getIsLoggedIn() async {
    final _prefs = await SharedPreferences.getInstance();
    final isLoggedIn = _prefs.getBool(IS_LOGGEDIN);
    return isLoggedIn;
  }

  static Future<void> setUid({String uId}) async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(UID, uId);
  }

  static Future<String> getUid() async {
    final _prefs = await SharedPreferences.getInstance();
    final uId = _prefs.getString(UID);
    return uId;
  }
}
