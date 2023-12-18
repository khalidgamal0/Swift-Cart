import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:swifit_cart/features/auth/data/models/login_model.dart';
import 'package:swifit_cart/features/auth/data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  static  LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);

  LoginModel? loginModel;
  AuthRepo authRepo;

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangePasswordVisibility());
  }

  // void userLogin({
  //   required String email,
  //   required String password,
  // })  {
  //   ApiService().post(
  //     urlEndPoint: loginUrl,
  //     queryParameters: {
  //       "email": email,
  //       "password": password,
  //     },
  //   ).then(
  //     (value) {
  //       loginModel = LoginModel.fromJson(value);
  //       print(loginModel?.data.token);
  //       emit(LoginSuccess(loginModel!));
  //     },
  //   ).catchError(
  //     (error) {
  //       print(error.toString());
  //       emit(LoginFailure(error.toString()));
  //     },
  //   );
  // }

   Future<void> userLogin({
     required String email,
     required String password,
  }) async {
    emit(LoginLoading());
    var loginResponse = await authRepo.login(email: email, password: password);
    loginResponse.fold((failure) {
      emit(LoginFailure(failure.errorMessage));
    }, (loginData) {
       emit(LoginSuccess(loginData));
    });
   }




}
