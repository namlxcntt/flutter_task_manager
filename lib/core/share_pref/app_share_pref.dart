import 'package:flutter_task_manager/core/share_pref/app_share_pref_key.dart';

abstract class AppSharePreference {
  Future<bool> saveInt({required AppSharePrefKey key, int value = 0});

  Future<bool> saveString({required AppSharePrefKey key, required String value});

  Future<bool> saveDouble({required AppSharePrefKey key, double value = 0.0});

  Future<bool> saveListString({required AppSharePrefKey key, required List<String> value});

  Future<bool> removeWithKey({required AppSharePrefKey key});

  Future<bool> has(AppSharePrefKey key);

  Object? getValue({required AppSharePrefKey key});

  String? getString({required AppSharePrefKey key});

  int? getInt({required AppSharePrefKey key});

  double? getDouble({required AppSharePrefKey key});

  Future<List<String>?> getListString({required AppSharePrefKey key});

  Future<bool> clear();
}
