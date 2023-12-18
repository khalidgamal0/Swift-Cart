import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/auth_model.dart';
import '../../data/repos/auth_repo.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
   static  AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  final AuthRepo authRepo;
  AuthModel? authModel;


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

  Future<void> signUp({
    required String? email,
    required String password,
    required String phone,
    required String name,
  }) async {
    var userSignUp = await authRepo.signUp(
        email: email, password: password, phone: phone, name: name);
    userSignUp.fold((failure) {
      emit(SignUpFailure(failure.errorMessage));
    }, (authModel) {
      emit(SignUpSuccess(authModel));
    });
  }


  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangePasswordVisibility());
  }

  
}
