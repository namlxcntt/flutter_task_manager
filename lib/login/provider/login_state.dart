import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.email() = _Email;
  const factory LoginState.password() = _Password;
  const factory LoginState.success( ) = _Success;
  const factory LoginState.error(String message) = _Error;
}