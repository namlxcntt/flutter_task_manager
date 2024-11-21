
import 'package:freezed_annotation/freezed_annotation.dart';
part 'task_model.freezed.dart';

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    required int taskId,
    required int taskListId,
    required String title,
    required String description,
    required DateTime dueDate,
    required String priority,
    required String status,
    required bool isRecurring,
    String? recurrencePattern,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TaskModel;

}