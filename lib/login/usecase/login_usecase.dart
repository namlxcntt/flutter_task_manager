import 'dart:async';

import 'package:flutter_task_manager/core/network/api_client.dart';
import 'package:flutter_task_manager/core/network/request/login_request.dart';
import 'package:flutter_task_manager/core/share_pref/app_share_pref.dart';
import 'package:flutter_task_manager/core/use_case/extensions.dart';
import 'package:flutter_task_manager/core/use_case/use_case.dart';
import 'package:flutter_task_manager/login/provider/login_state.dart';

class LoginUseCase extends UseCase<LoginRequest, LoginState> {
  final ApiClient apiClient;
  final AppSharePreference sharePreference;

  LoginUseCase(this.apiClient, this.sharePreference);

  @override
  Future<LoginState> execute(LoginRequest input) async {
    var response = await callAndCaptureError(() async {
      var loginResponse = await apiClient.login(input);
      if (loginResponse.data == null || loginResponse.status != 0) {
        return LoginState.error(loginResponse.errorMessage ?? '', ErrorLoginType.NOTHING);
      }
      return const LoginState.success();
    });
    if(response.error != null) {
      return const LoginState.error('Something went wrong', ErrorLoginType.NOTHING);
    }
    return const LoginState.error('Something went wrong', ErrorLoginType.NOTHING);
  }
}
