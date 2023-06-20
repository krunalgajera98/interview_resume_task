import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences prefsData;

  static Future initMySharedPreferences() async {
    prefsData = await SharedPreferences.getInstance();
  }

  /// setter
  static Future<void> setString({required String key, required String value}) async {
    print("Set string key:$key & value: $value");
    await prefsData.setString(key, value);
  }

  /// getter
  static String getString({required String key}) {
    String value = prefsData.getString(key) ?? "";
    print("Get string key: $key & value: $value");
    return value;
  }

  static Future<void> clear() async {
    prefsData.clear();
  }
}

class PrefString {
  static const String resumeList = 'resumeList';
}
