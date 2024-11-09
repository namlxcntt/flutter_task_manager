import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.email() = LoginStateEmail;
  const factory LoginState.password() = LoginStatePassword;
  const factory LoginState.success( ) = LoginStateSuccess;
  const factory LoginState.error(String message,ErrorType errorType) = LoginStateError;
}

enum ErrorType {
  EMAIL,
  PASSWORD,
  UNKNOW
}