import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/features/main/provider/current_index_provider.dart';
import 'package:flutter_task_manager/generated/assets.gen.dart';
import 'package:flutter_task_manager/utils/logger.dart';
import 'package:go_router/go_router.dart';

class DashBoardWithNestedNavigation extends ConsumerStatefulWidget {
  const DashBoardWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  @override
  ConsumerState<DashBoardWithNestedNavigation> createState() =>
      _ScaffoldWithNestedNavigationState();
}

class _ScaffoldWithNestedNavigationState
    extends ConsumerState<DashBoardWithNestedNavigation> {
  void _goBranch(int index) {
    LogUtils.getInstance.d('currentIndex: ${index}');
    widget.navigationShell.goBranch(
      index,
      // A  common pattern when using bottom navigation bars is to support
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(currentIndexProvider, (previous, next) {
      _goBranch(next);
    });

    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
              items:  [
                // BottomNavigationBarItem(icon: Assets.sv, label: 'Task'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.list), label: 'Task List'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle), label: 'Account'),
              ],
              currentIndex: ref.watch(currentIndexProvider),
              onTap: (index) {
                ref.read(currentIndexProvider.notifier).updateIndex(index);
              })),
    );
  }
}
