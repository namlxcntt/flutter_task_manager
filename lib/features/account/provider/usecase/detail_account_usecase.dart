import 'package:flutter_task_manager/core/network/api_client.dart';
import 'package:flutter_task_manager/core/network/response/user/user_response.dart';
import 'package:flutter_task_manager/core/share_pref/app_share_pref.dart';
import 'package:flutter_task_manager/core/use_case/use_case.dart';

class DetailAccountUseCase extends UseCase<Object?, UserResponse?> {
  final ApiClient apiClient;
  final AppSharePreference sharePreference;

  DetailAccountUseCase({required this.apiClient, required this.sharePreference});

  @override
  Future<UserResponse?> execute(Object? input) async {
     var response = await apiClient.getDetailUser();
     return response.data;
  }
}