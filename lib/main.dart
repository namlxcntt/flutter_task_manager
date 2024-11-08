import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/core/network/provider/network_provider.dart';
import 'package:flutter_task_manager/application/task_manager_application.dart';
import 'package:flutter_task_manager/core/share_pref/app_share_pref.dart';
import 'package:flutter_task_manager/core/share_pref/app_share_pref_impl.dart';
import 'package:flutter_task_manager/utils/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  bootstrap();
}
void bootstrap() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final AppSharePreference appSharePreference = AppSharePrefImpl(prefs);
    WidgetsFlutterBinding.ensureInitialized();
    // Ensure
    runApp(
      ProviderScope(
        overrides: [
          appSharePrefProvider.overrideWithValue(appSharePreference),
          //Overrides for value async
        ],
        child: const TaskManagerApplication(),
      ),
    );
  }, (Object error, StackTrace stack) async {
    LogUtils.getInstance.e('Error global -> ${error.toString()}');
  });
}
