import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/application/router/router.dart';
import 'package:flutter_task_manager/generated/l10n.dart';
import 'package:flutter_task_manager/utils/theme.dart';

class TaskManagerApplication extends ConsumerWidget {
  const TaskManagerApplication({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      localizationsDelegates: const [
        S.delegate,
      ],
      routerConfig: goRouter,
      locale: const Locale.fromSubtags(languageCode: 'en'),
      title: 'TaskManager',
      themeMode: ThemeMode.light,
      theme: ThemeUtils.getInstance.lightTheme,
    );
  }
}
