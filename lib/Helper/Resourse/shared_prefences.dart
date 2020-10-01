import 'package:shared_preferences/shared_preferences.dart';

mixin SharedPrefsHelper {
  setSharedPreference({String stringValue, int intValue, bool boolValue, double doubleValue, String key, int type}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (type == 0) await prefs.setString(key, stringValue);
    if (type == 1) await prefs.setBool(key, boolValue);
    if (type == 2) await prefs.setDouble(key, doubleValue);
    if (type == 3) await prefs.setInt(key, intValue);
  }

  Future<dynamic> getSharedPreference(String key, int type) async {
    SharedPreferences sPrefs = await SharedPreferences.getInstance();
    if (type == 0) return sPrefs.getString(key) ?? "";
    if (type == 1) return sPrefs.getBool(key) ?? false;
    if (type == 2) return sPrefs.getDouble(key) ?? 0.0;
    if (type == 3) return sPrefs.getInt(key) ?? -1;
  }

  setClear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
