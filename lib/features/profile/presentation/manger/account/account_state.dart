part of 'account_cubit.dart';

abstract class AccountState {}

class AccountInitial extends AccountState {}
class AccountLoadingState extends AccountState {}

class GetAccountSuccessState extends AccountState {
  final AuthModel authModel;

  GetAccountSuccessState(this.authModel);
}
class GetAccountErrorState extends AccountState {
  final String errorMessage;

  GetAccountErrorState(this.errorMessage);
}

class UpdateAccountSuccessState extends AccountState {
  final AuthModel authModel;

  UpdateAccountSuccessState(this.authModel);
}
class UpdateAccountErrorState extends AccountState {
  final String errorMessage;

  UpdateAccountErrorState(this.errorMessage);
}

class LogOutSuccessState extends AccountState {}
class LogOutErrorState extends AccountState {}

