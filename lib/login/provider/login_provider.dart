import 'package:flutter_task_manager/core/network/provider/network_provider.dart';
import 'package:flutter_task_manager/core/network/request/login_request.dart';
import 'package:flutter_task_manager/login/provider/login_state.dart';
import 'package:flutter_task_manager/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<LoginState> build() {
    return const LoginState.email();
  }

  void updateState(LoginState loginState) async {
    state = AsyncData(loginState);
  }

  void login() async {
    var loginRequest = LoginRequest(email: "namlxcntt@gmail.com", password: "Abcd@1234");
    var apiClient = ref.read(apiClientPrefProvider);
    final loginResponse = await apiClient.login(loginRequest);
    LogUtils.getInstance.d("loginResponse $loginResponse");
  }
}
