import 'package:flutter_task_manager/core/share_pref/app_share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_share_pref_key.dart';

class AppSharePrefImpl extends AppSharePreference {
  final SharedPreferences _sharedPreferences;

  AppSharePrefImpl(this._sharedPreferences);

  @override
  Future<bool> saveInt({required AppSharePrefKey key, int value = 0}) async {
    return _sharedPreferences.setInt(key.getKey(), value);
  }

  @override
  Future<bool> saveString({required AppSharePrefKey key, required String value}) async {
    return _sharedPreferences.setString(key.getKey(), value);
  }

  @override
  Future<bool> saveDouble({required AppSharePrefKey key, double value = 0.0}) async {
    return _sharedPreferences.setDouble(key.getKey(), value);
  }

  @override
  Future<bool> saveListString({required AppSharePrefKey key, required List<String> value}) async {
    return _sharedPreferences.setStringList(key.getKey(), value);
  }

  @override
  Future<bool> removeWithKey({required AppSharePrefKey key}) {
    return _sharedPreferences.remove(key.getKey());
  }

  @override
  Future<bool> has(AppSharePrefKey key) async {
    return _sharedPreferences.containsKey(key.getKey());
  }

  @override
  double? getDouble({required AppSharePrefKey key}) {
    return _sharedPreferences.getDouble(key.getKey());
  }

  @override
  int? getInt({required AppSharePrefKey key}) {
    return _sharedPreferences.getInt(key.getKey());
  }

  @override
  Future<List<String>?> getListString({required AppSharePrefKey key}) async {
    return _sharedPreferences.getStringList(key.getKey());
  }

  @override
  Future<Object?> getValue({required AppSharePrefKey key}) async {
    return _sharedPreferences.get(key.getKey());
  }

  @override
  String? getString({required AppSharePrefKey key}) {
    return _sharedPreferences.getString(key.getKey());
  }

  @override
  Future<bool> clear() async {
    return _sharedPreferences.clear();
  }

  @override
  Object? getNotAsync(String key) {
       _sharedPreferences.get(key);
    return null;
  }
}
