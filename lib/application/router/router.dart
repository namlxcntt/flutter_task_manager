import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/core/network/provider/network_provider.dart';
import 'package:flutter_task_manager/core/share_pref/app_share_pref_key.dart';
import 'package:flutter_task_manager/features/account/account_page.dart';
import 'package:flutter_task_manager/features/login/login_page.dart';
import 'package:flutter_task_manager/features/main/dashboard_page_with_nested_router.dart';
import 'package:flutter_task_manager/features/task_list/task_list_page.dart';
import 'package:flutter_task_manager/features/tasks/task_page.dart';
import 'package:flutter_task_manager/utils/constant.dart';
import 'package:flutter_task_manager/utils/extensions.dart';
import 'package:flutter_task_manager/utils/logger.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  /// Navigation bar
  loginPage,
  taskPage,
  taskListPage,
  accountPage,
  home;

  String getPath() => "/$name";
}

final _homeGlobalKey = GlobalKey();
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKeyTaskPage =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorTaskPage');
final _shellNavigatorKeyTaskListPage =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorTaskListPage');
final _shellNavigatorKeyAccountPage =
    GlobalKey<NavigatorState>(debugLabel: 'eshellNavigatorKeyAccountPage');

final goRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  redirect: (context, state) {
    // Check auth and redirect path
    final container = ProviderScope.containerOf(context);
    final appSharePreference = container.read(appSharePrefProvider);
    final bool? loggedIn = appSharePreference
        .getString(key: AppSharePrefKey.tokenUser)
        ?.isNotNullOrEmpty();

    final currentPath = state.fullPath;
    if (currentPath == null || currentPath == '/') {
      if (loggedIn == true) {
        LogUtils.getInstance.d('Hello');
        return AppRoute.taskPage.getPath();
      } else {
        LogUtils.getInstance.d('Hello');
        return AppConstant.forwardSlash;
      }
    }
    return null;
  },
  routes: [
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state, navigationShell) {
        return NoTransitionPage(
            child: DashBoardWithNestedNavigation(
                key: _homeGlobalKey, navigationShell: navigationShell));
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorKeyTaskPage,
          routes: [
            GoRoute(
              path: AppRoute.taskPage.getPath(),
              name: AppRoute.taskPage.name,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: TaskPage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorKeyTaskListPage,
          routes: [
            GoRoute(
              path: AppRoute.taskListPage.getPath(),
              name: AppRoute.taskListPage.name,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: TaskListPage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorKeyAccountPage,
          routes: [
            GoRoute(
              path: AppRoute.accountPage.getPath(),
              name: AppRoute.accountPage.name,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AccountPage(),
              ),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AppConstant.forwardSlash,
      name: AppRoute.loginPage.name,
      pageBuilder: (context, state) {
        return const CupertinoPage(
          child: LoginPage(),
        );
      },
    ),
  ],
);
