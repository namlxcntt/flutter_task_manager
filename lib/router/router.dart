import 'package:flutter/material.dart';
import 'package:flutter_task_manager/login/login_page.dart';
import 'package:flutter_task_manager/main/dashboard_page_with_nested_router.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  /// Navigation bar
  loginPage,
  main,
  home;

  String getPath() => "/$name";
}

final _homeGlobalKey = GlobalKey();
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorHome');
final _shellNavigatorCreateVideoKey = GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorCreateVideo');
final _shellNavigatorStoryKey = GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorStory');
final _shellNavigatorHomeWidgetKey = GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorHomeWidget');

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
        // StatefulShellBranch(
        //   navigatorKey: _shellNavigatorHomeKey,
        //   routes: [
        //     GoRoute(
        //       path: "/",
        //       name: AppRoute.home.name,
        //       pageBuilder: (context, state) => const NoTransitionPage(
        //         child: Scaffold(),
        //       ),
        //     ),
        //   ],
        // ),
        // // Shell branch CreateVideo
        // StatefulShellBranch(
        //   navigatorKey: _shellNavigatorHomeWidgetKey,
        //   routes: [
        //     GoRoute(
        //       path: AppRoute.homeWidget.getPath(),
        //       name: AppRoute.homeWidget.name,
        //       pageBuilder: (context, state) => const NoTransitionPage(
        //         child: Scaffold(),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AppRoute.loginPage.getPath(),
      name: AppRoute.loginPage.name,
      pageBuilder: (context, state) {
        return const MaterialPage(
          child: LoginPage(),
        );
      },
    ),
  ],
);
