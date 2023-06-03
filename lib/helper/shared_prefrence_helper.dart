import 'dart:ffi';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static late SharedPreferences _prefsInstance;
  var _prefs;
  static const String _requestId = "requestId";

  static final SharedPreferenceHelper _singleton =
  SharedPreferenceHelper._internal();

  SharedPreferenceHelper._internal() {
    _prefs ??= SharedPreferences.getInstance();
  }

  static Future<SharedPreferences> init() async {
    _prefsInstance = await SharedPreferences.getInstance();
    return _prefsInstance;
  }

  factory SharedPreferenceHelper() {
    return _singleton;
  }

  _savePref(String key, Object? value) async {
    var prefs = _prefsInstance;
    if (prefs.containsKey(key)) {
      prefs.remove(key);
    }
    if (value is bool) {
      return prefs.setBool(key, value);
    } else if (value is int) {
      return prefs.setInt(key, value);
    } else if (value is String) {
      return prefs.setString(key, value);
    } else if (value is Double || value is Float) {
      return prefs.setDouble(key, value as double);
    }
  }

  T _getPref<T>(String key) {
    return _prefsInstance.get(key) as T;
  }

  void clearAll() {
    _prefsInstance.clear();
  }

  void saveRequestId(String value){
    _savePref(_requestId, value);

  }

  String getRequestId() {
    return _getPref(_requestId) ?? "";
  }

}
