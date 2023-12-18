import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:swifit_cart/features/auth/data/models/sign_up_model.dart';
import 'package:swifit_cart/features/auth/data/repos/auth_repo.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  AuthRepo  authRepo;

  static SignUpCubit get(context) => BlocProvider.of<SignUpCubit>(context);
  SignUpModel ?signUpModel;


  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangePasswordVisibility());
  }

  // Future<void> signUp({ required String? email,
  //   required String password,
  //   required String phone,
  //   required String name,}) async {
  //   emit(SignUpLoading());
  //   await ApiService().post(
  //       urlEndPoint: registerUrl,
  //       queryParameters: {
  //         'name': name,
  //         'email': email,
  //         'password': password,
  //         'phone': phone,
  //   }).then((value) {
  //     signUpModel =SignUpModel.fromJson(value);
  //     print(signUpModel?.data!.token);
  //      emit(SignUpSuccess(signUpModel!));
  //   }).catchError((error){
  //     print(error);
  //     emit(SignUpFailure(error.toString()));
  //   });
  //
  //
  // }

Future<void> signUp({required String? email,
    required String password,
    required String phone,
    required String name,
  })async{
       var userSignUp = await authRepo.signUp(email: email, password: password, phone: phone, name: name);
       userSignUp.fold((failure) {
        emit(SignUpFailure(failure.errorMessage));
       }, (signUpModel) {
          emit(SignUpSuccess(signUpModel));
       });
  }
}
