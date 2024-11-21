import 'package:freezed_annotation/freezed_annotation.dart';
part 'task_response.g.dart';
part 'task_response.freezed.dart';

@freezed
class TaskResponse with _$TaskResponse {
  const factory TaskResponse({
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
  }) = _TaskResponse;

  factory TaskResponse.fromJson(Map<String, dynamic> json) => _$TaskResponseFromJson(json);
}