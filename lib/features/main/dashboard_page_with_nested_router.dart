import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/application/router/router.dart';
import 'package:flutter_task_manager/core/widget/gradient_color.dart';
import 'package:flutter_task_manager/features/main/provider/current_index_provider.dart';
import 'package:flutter_task_manager/generated/assets.gen.dart';
import 'package:flutter_task_manager/utils/extensions.dart';
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

    const gradient = LinearGradient(
      colors: [
        Color(0xFF8B78FF),
        Color(0xFF5451D6),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: context.getColorScheme().onSurface,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          items: [
            BottomNavigationBarItem(
                icon: GradientIcon(
                  icon: Assets.svg.icHomeDashboard.svg(),
                  size: 24.0,
                  gradient: gradient,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: GradientIcon(
                  icon: Assets.svg.icHomeCalendar.svg(),
                  size: 24.0,
                  gradient: gradient,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: GradientIcon(
                  icon: Assets.svg.icHomeChat.svg(),
                  size: 24.0,
                  gradient: gradient,
                ),
                label: ''),
          ],
          currentIndex: ref.watch(currentIndexProvider),
          onTap: (index) {
            ref.read(currentIndexProvider.notifier).updateIndex(index);
          },
        ),
      ),
    );
  }
}
