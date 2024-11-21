import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/core/network/provider/network_provider.dart';
import 'package:flutter_task_manager/features/tasks/provider/all_tasks_state.dart';
import 'package:flutter_task_manager/features/tasks/usecase/all_tasks_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'all_task_provider.g.dart';

@riverpod
AllTaskUseCase allTaskUseCase(Ref ref) {
  final apiClient = ref.read(apiClientPrefProvider);
  return AllTaskUseCase(apiClient);
}

@riverpod
class AllTaskController extends _$AllTaskController {
  @override
  FutureOr<AllTaskState> build() async {
    final useCase = ref.read(allTaskUseCaseProvider);
    return await useCase.execute('');
  }
}
