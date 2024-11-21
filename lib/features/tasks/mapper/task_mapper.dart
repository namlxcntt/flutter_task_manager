import 'package:flutter_task_manager/core/network/response/tasks/task_response.dart';
import 'package:flutter_task_manager/features/tasks/model/task_model.dart';

class TaskMapper {
  static TaskModel mapFromResponse(TaskResponse response) {
    return TaskModel(
      taskId: response.taskId,
      taskListId: response.taskListId,
      title: response.title,
      description: response.description,
      dueDate: response.dueDate,
      priority: response.priority,
      status: response.status,
      isRecurring: response.isRecurring,
      recurrencePattern: response.recurrencePattern,
      createdAt: response.createdAt,
      updatedAt: response.updatedAt,
    );
  }

  static TaskResponse mapFromModel(TaskModel model) {
    return TaskResponse(
      taskId: model.taskId,
      taskListId: model.taskListId,
      title: model.title,
      description: model.description,
      dueDate: model.dueDate,
      priority: model.priority,
      status: model.status,
      isRecurring: model.isRecurring,
      recurrencePattern: model.recurrencePattern,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }
}