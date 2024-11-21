import 'package:flutter_task_manager/features/tasks/model/task_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_tasks_state.freezed.dart';

@freezed
abstract class AllTaskState with _$AllTaskState {
  const factory AllTaskState.success(List<TaskModel> tasks) = AllTaskStateSuccess;
  const factory AllTaskState.error(String message) = AllTaskStateError;
}
