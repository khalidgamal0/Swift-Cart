part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}
class LoginSuccess extends AuthState {
  final AuthModel loginModel;

  LoginSuccess(this.loginModel);

}
class LoginFailure extends AuthState {
  final String errorMessage;

  LoginFailure(this.errorMessage);
}

class SignUpLoading extends AuthState {}
class SignUpSuccess extends AuthState {
  final AuthModel signUpModel;

  SignUpSuccess(this.signUpModel);

}
class SignUpFailure extends AuthState {
  final String errorMessage;

  SignUpFailure(this.errorMessage);
}


class ChangePasswordVisibility extends AuthState{}
