import 'dart:async';

import 'package:flutter_task_manager/core/network/api_client.dart';
import 'package:flutter_task_manager/core/network/request/login_request.dart';
import 'package:flutter_task_manager/core/network/response/base_response.dart';
import 'package:flutter_task_manager/core/share_pref/app_share_pref.dart';
import 'package:flutter_task_manager/core/use_case/use_case.dart';
import 'package:flutter_task_manager/login/provider/login_state.dart';
import 'package:flutter_task_manager/utils/utils.dart';

class LoginUseCase extends UseCase<LoginRequest, LoginState> {
  final ApiClient apiClient;
  final AppSharePreference sharePreference;

  LoginUseCase(this.apiClient, this.sharePreference);

  @override
  Future<LoginState> execute(LoginRequest input) async {
    final loginResponse = await apiClient.login(input).catchError((error) {
      return LoginState.error(
          error.toString(), ErrorType.UNKNOW);
    });

    if (loginResponse.data == null || loginResponse.status != 0) {
      return LoginState.error(
          loginResponse.errorMessage ?? '', ErrorType.UNKNOW);
    }
    return const LoginState.success();
  }
}
