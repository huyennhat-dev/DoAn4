import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<bool> save(String key, String data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(key, data);
  }

  Future<String?> read(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  Future<bool> remove(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove(key);
  }
}
