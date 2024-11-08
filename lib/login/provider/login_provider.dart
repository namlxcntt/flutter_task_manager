import 'package:flutter_task_manager/login/provider/login_state.dart';
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
}
