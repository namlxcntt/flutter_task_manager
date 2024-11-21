import 'package:flutter_task_manager/core/network/api_client.dart';
import 'package:flutter_task_manager/core/network/response/login/login_response.dart';
import 'package:flutter_task_manager/core/use_case/extensions.dart';
import 'package:flutter_task_manager/core/use_case/use_case.dart';
import 'package:flutter_task_manager/features/tasks/mapper/task_mapper.dart';
import 'package:flutter_task_manager/features/tasks/provider/all_tasks_state.dart';
import 'package:flutter_task_manager/utils/extensions.dart';

class AllTaskUseCase extends UseCase<Object, AllTaskState> {
  final ApiClient apiClient;

  AllTaskUseCase(this.apiClient);

  @override
  Future<AllTaskState> execute(Object input) async {
    var response = await callAndCaptureError(() async {
      var loginResponse = await apiClient.getTasks();
      var data = loginResponse.data;
      if (data == null || loginResponse.status != 0) {
        return AllTaskState.error(loginResponse.errorMessage!.ifNullOrEmpty());
      } else {
        return AllTaskState.success(
            data.map((e) => TaskMapper.mapFromResponse(e)).toList());
      }
    });
    if (response.error != null) {
      return AllTaskState.error('${response.error?.message}');
    }
    return response.data!;
  }
}
