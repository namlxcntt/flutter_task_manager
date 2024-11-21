import 'package:json_annotation/json_annotation.dart';

part 'task_request.g.dart';

@JsonSerializable()
class TaskRequest {
  final int? taskId;
  final int? taskListId;
  final String? title;
  final String? description;
  final DateTime? dueDate;
  final String? priority;
  final String? status;
  final bool? isRecurring;
  final String? recurrencePattern;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  TaskRequest({
    this.taskId,
    this.taskListId,
    this.title,
    this.description,
    this.dueDate,
    this.priority,
    this.status,
    this.isRecurring,
    this.recurrencePattern,
    this.createdAt,
    this.updatedAt,
  });

  factory TaskRequest.fromJson(Map<String, dynamic> json) => _$TaskRequestFromJson(json);
  Map<String, dynamic> toJson() => _$TaskRequestToJson(this);
}