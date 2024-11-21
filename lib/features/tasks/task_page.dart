import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/core/network/provider/network_provider.dart';
import 'package:flutter_task_manager/core/widget/asyn_widget.dart';
import 'package:flutter_task_manager/features/account/provider/detail_user_provider.dart';
import 'package:flutter_task_manager/features/tasks/provider/all_task_provider.dart';
import 'package:flutter_task_manager/features/tasks/provider/all_tasks_state.dart';
import 'package:flutter_task_manager/generated/assets.gen.dart';
import 'package:flutter_task_manager/utils/app_size.dart';
import 'package:flutter_task_manager/utils/extensions.dart';
import 'package:flutter_task_manager/utils/logger.dart';
import 'package:flutter_task_manager/utils/theme.dart';

part 'circle_with_search_icon.dart';

part 'circle_with_avatar_user.dart';

part 'tasks_pending.dart';

class TaskPage extends ConsumerStatefulWidget {
  const TaskPage({super.key});

  @override
  ConsumerState createState() => _TaskPageState();
}

class _TaskPageState extends ConsumerState<TaskPage> {
  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(allTaskControllerProvider);
    final user = ref.watch(streamUserProvider);
    LogUtils.getInstance.d('User -> $user');
    return Scaffold(
      backgroundColor: context.getColorScheme().onSurface,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            snap: false,
            backgroundColor: context.getColorScheme().onSurface,
            surfaceTintColor: context.getColorScheme().onSurface,
            pinned: true,
            expandedHeight: kToolbarHeight + AppSize.size12,
            collapsedHeight: kToolbarHeight + AppSize.size12,
            actions: const [],
            flexibleSpace: Container(
              padding: MediaQuery.of(context).padding,
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(50)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Monday',
                          style: context
                              .titleSmall()
                              ?.copyWith(color: Palette.textColorSecondary),
                        ),
                        AppSize.size2.gap(),
                        Text(
                          '25 Octorber',
                          style: context.headlineMedium(),
                        ),
                      ],
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const CircleWithSearchIcon(),
                        AppSize.size16.gap(),
                        const CircleWithAvatarUser()
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //App bar
                  AppSize.size16.gap(),
                  Text(
                    'Hi Surf.',
                    style: context.headlineLarge(),
                  ),
                  AppSize.size2.gap(),
                  Text('5 tasks are pendings..',
                      style: context
                          .bodyMedium()
                          ?.copyWith(color: Palette.textColorSecondary)),
                  AppSize.size16.gap(),
                  const TasksPending()
                ],
              ),
            ),
            // child: AsyncWidget(
            //   asyncValue: tasks,
            //   builderData: (data) {
            //     if (data is AllTaskStateSuccess) {
            //       return ListView.builder(
            //         itemBuilder: (context, index) {
            //           return ListTile(
            //             title: Text(data.tasks[index].title),
            //             subtitle: Text(data.tasks[index].description),
            //           );
            //         },
            //         itemCount: data.tasks.length,
            //       );
            //     } else {
            //       return const SizedBox();
            //     }
            //   },
            // ),
          )
        ],
      ),
    );
  }
}
