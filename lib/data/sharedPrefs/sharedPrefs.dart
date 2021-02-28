import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static String IS_LOGGEDIN = "IS_LOGGEDIN";
  static String UID = "UID";
  static String USERNAME = "USERNAME";
  static String USERIMAGE = "USERIMAGE";
  static String USEREMAIL = "USEREMAIL";

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
}
