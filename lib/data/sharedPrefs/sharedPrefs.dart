import 'package:shared_preferences/shared_preferences.dart';

// ignore: avoid_classes_with_only_static_members
class SharedPrefs {
  // ignore: non_constant_identifier_names
  static String IS_LOGGEDIN = "IS_LOGGEDIN";
  // ignore: non_constant_identifier_names
  static String UID = "UID";
  // ignore: non_constant_identifier_names
  static String USERNAME = "USERNAME";
  // ignore: non_constant_identifier_names
  static String USERIMAGE = "USERIMAGE";
  // ignore: non_constant_identifier_names
  static String USEREMAIL = "USEREMAIL";
  // ignore: non_constant_identifier_names
  static String LOCALE = "LOCALE";
  // ignore: non_constant_identifier_names
  static String ONBOARDING = "ONBOARDING";

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

  static Future<void> setUserName({String userName}) async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(USERNAME, userName);
  }

  static Future<String> getUserName() async {
    final _prefs = await SharedPreferences.getInstance();
    final userName = _prefs.getString(USERNAME);
    return userName;
  }

  static Future<void> setPhotoUrl({String photoUrl}) async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(USERIMAGE, photoUrl);
  }

  static Future<String> getPhotoURL() async {
    final _prefs = await SharedPreferences.getInstance();
    final photoURL = _prefs.getString(USERIMAGE);
    return photoURL;
  }

  static Future<void> setEmail({String email}) async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(USEREMAIL, email);
  }

  static Future<String> getEmail() async {
    final _prefs = await SharedPreferences.getInstance();
    final email = _prefs.getString(USEREMAIL);
    return email;
  }

  static Future<void> setLocale({String locale}) async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(LOCALE, locale);
  }

  static Future<String> getLocale() async {
    final _prefs = await SharedPreferences.getInstance();
    final locale = _prefs.getString(LOCALE);
    return locale;
  }

  static Future<void> setOnBoard({bool onBoard}) async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.setBool(ONBOARDING, onBoard);
  }

  static Future<bool> getOnBoard() async {
    final _prefs = await SharedPreferences.getInstance();
    final onBoard = _prefs.getBool(ONBOARDING);
    return onBoard;
  }
}
