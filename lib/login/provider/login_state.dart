import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.email() = LoginStateEmail;
  const factory LoginState.password() = LoginStatePassword;
  const factory LoginState.success( ) = LoginStateSuccess;
  const factory LoginState.error(String message,ErrorLoginType errorType) = LoginStateError;
}

enum ErrorLoginType {
  EMAIL,
  PASSWORD,
  NOTHING
}