import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DashBoardWithNestedNavigation extends ConsumerStatefulWidget {
  const DashBoardWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  @override
  ConsumerState<DashBoardWithNestedNavigation> createState() => _ScaffoldWithNestedNavigationState();
}

class _ScaffoldWithNestedNavigationState extends ConsumerState<DashBoardWithNestedNavigation> {
  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index, // A  common pattern when using bottom navigation bars is to support
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      // ref.listenManual(initDataAppProvider, (prev, next) {
      //   if (next.value == false) {
      //     AppLoading.show(context, ref);
      //    } else {
      //     AppLoading.hide(context, ref);
      //   }
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    // ref.listen(currentIndexProvider, (previous, next) {
    //   _goBranch(next);
    // });

    return Scaffold(
      body: widget.navigationShell,
    );
  }
}
