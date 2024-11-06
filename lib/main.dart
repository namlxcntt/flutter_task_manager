import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/application/task_manager_application.dart';
import 'package:flutter_task_manager/utils/logger.dart';

void main() {
  bootstrap();
}
void bootstrap() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Ensure
    runApp(
      const ProviderScope(
        overrides: [
          //Overrides for value async
        ],
        child: TaskManagerApplication(),
      ),
    );
  }, (Object error, StackTrace stack) async {
    LogUtils.getInstance.e('Error global -> ${error.toString()}');
  });
}
