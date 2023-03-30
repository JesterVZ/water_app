part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.login(bool response) = _Login;
  const factory LoginState.error(String message) = _ErrorLogin;
}
