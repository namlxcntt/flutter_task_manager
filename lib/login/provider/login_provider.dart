import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/core/network/provider/network_provider.dart';
import 'package:flutter_task_manager/core/network/request/login_request.dart';
import 'package:flutter_task_manager/core/share_pref/app_share_pref.dart';
import 'package:flutter_task_manager/core/share_pref/app_share_pref_key.dart';
import 'package:flutter_task_manager/login/provider/login_state.dart';
import 'package:flutter_task_manager/login/usecase/login_usecase.dart';
import 'package:flutter_task_manager/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
LoginUseCase loginUseCase(Ref ref) {
  final appSharePref = ref.read(appSharePrefProvider);
  final apiClient = ref.read(apiClientPrefProvider);
  return LoginUseCase(apiClient, appSharePref);
}

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<LoginState> build() {
    return const LoginState.email();
  }

  void updateState(LoginState loginState) async {
    state = AsyncData(loginState);
  }

  AppSharePreference _appSharePreference() {
    return ref.read(appSharePrefProvider);
  }

  void login({String? email, String? password}) async {
    if (email == null || email.isEmpty) {
      updateState(
          const LoginState.error('Email is required', ErrorLoginType.EMAIL));
      return;
    }

    if (password == null || password.isEmpty) {
      updateState(const LoginState.error(
          'Password is required', ErrorLoginType.PASSWORD));
      return;
    }
    if (AppUtils.isValidEmail(email) == false) {
      updateState(
          const LoginState.error('Email is valid ', ErrorLoginType.EMAIL));
      return;
    }
    if (password.length < 6) {
      updateState(const LoginState.error(
          'Password must be at least 6 characters', ErrorLoginType.PASSWORD));
      return;
    }
    state = const AsyncLoading();
    var loginRequest = LoginRequest(email: email, password: password);
    var apiClient = await ref.read(loginUseCaseProvider).execute(loginRequest);
    updateState(apiClient);
  }
}
