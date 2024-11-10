import 'dart:async';
import 'dart:math';

import 'package:flutter_task_manager/core/network/api_client.dart';
import 'package:flutter_task_manager/core/network/request/login_request.dart';
import 'package:flutter_task_manager/core/share_pref/app_share_pref.dart';
import 'package:flutter_task_manager/core/share_pref/app_share_pref_key.dart';
import 'package:flutter_task_manager/core/use_case/extensions.dart';
import 'package:flutter_task_manager/core/use_case/use_case.dart';
import 'package:flutter_task_manager/features/login/provider/login_state.dart';
import 'package:flutter_task_manager/utils/extensions.dart';

class LoginUseCase extends UseCase<LoginRequest, LoginState> {
  final ApiClient apiClient;
  final AppSharePreference sharePreference;

  LoginUseCase(this.apiClient, this.sharePreference);

  @override
  Future<LoginState> execute(LoginRequest input) async {
    var response = await callAndCaptureError(() async {
      var loginResponse = await apiClient.login(input);
      var data = loginResponse.data;
      if (data == null || loginResponse.status != 0) {
        return LoginState.error(
            loginResponse.errorMessage.ifNullOrEmpty(), ErrorLoginType.NOTHING);
      }
      await sharePreference.saveString(
          key: AppSharePrefKey.tokenUser,
          value: data.bearToken.ifNullOrEmpty());
      await sharePreference.saveString(
          key: AppSharePrefKey.refreshToken,
          value: data.refreshToken.ifNullOrEmpty());
    });
    if (response.error != null) {
      return const LoginState.error(
          'Something went wrong', ErrorLoginType.NOTHING);
    }
    return const LoginState.success();
  }
}
