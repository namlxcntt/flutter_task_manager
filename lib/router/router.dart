import 'package:flutter/material.dart';
import 'package:flutter_task_manager/account/account_page.dart';
import 'package:flutter_task_manager/login/login_page.dart';
import 'package:flutter_task_manager/main/dashboard_page_with_nested_router.dart';
import 'package:flutter_task_manager/task_list/task_list_page.dart';
import 'package:flutter_task_manager/tasks/task_page.dart';
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
final _shellNavigatorKeyTaskPage = GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorTaskPage');
final _shellNavigatorKeyTaskListPage = GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorTaskListPage');
final _shellNavigatorKeyAccountPage = GlobalKey<NavigatorState>(debugLabel: 'eshellNavigatorKeyAccountPage');

final goRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state, navigationShell) {
        return NoTransitionPage(
            child: DashBoardWithNestedNavigation(key: _homeGlobalKey, navigationShell: navigationShell));
      },
      branches: [
        // Shell branch Home
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
      path: '/',
      name: AppRoute.loginPage.name,
      pageBuilder: (context, state) {
        return const MaterialPage(
          child: LoginPage(),
        );
      },
    ),
  ],
);
