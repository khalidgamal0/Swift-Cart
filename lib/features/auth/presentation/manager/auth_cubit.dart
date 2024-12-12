import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifit_cart/core/widgets/toast.dart';
import '../../../../constant.dart';
import '../../../../core/utils/functions/navigate.dart';
import '../../../../core/utils/shared_prefrence.dart';
import '../../../layout/layout_view.dart';
import '../../data/models/auth_model.dart';
import '../../data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  final AuthRepo authRepo;
  AuthModel? authModel;

  var formKeyLogin = GlobalKey<FormState>();
  var formKeyRegister = GlobalKey<FormState>();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPassController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<void> userLogin({
    required BuildContext context,
  }) async {
    emit(LoginLoading());
    var loginResponse = await authRepo.login(
        email: loginEmailController.text, password: loginPassController.text);
    loginResponse.fold((failure) {
      showToast(message: failure.toString(), state: ToastStates.error);
      emit(LoginFailure(failure.errorMessage));
    }, (loginData) {
      if (loginData.status!) {
        SharedPreference.setData(
          key: "token",
          value: loginData.data!.token,
        ).then(
          (value) {
            token = loginData.data!.token;
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Success Login"),
              backgroundColor: Colors.green,
            ));
            if (!Platform.isWindows) {
              showToast(
                message: "Success Login",
                state: ToastStates.success,
              );
            }
            navigateAndFinish(
              context,
              const LayoutView(),
            );
          },
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(loginData.message!),
          backgroundColor: Colors.red,
        ));
        if (!Platform.isWindows) {
          showToast(
            message: loginData.message!,
            state: ToastStates.error,
          );
        }
      }
      emit(LoginSuccess(loginData));
    });
  }

  Future<void> signUp({
    required BuildContext context,
  }) async {
    emit(SignUpLoading());
    var userSignUp = await authRepo.signUp(
        email: emailController.text,
        password: passController.text,
        phone: phoneController.text,
        name: nameController.text);
    userSignUp.fold((failure) {
      emit(SignUpFailure(failure.errorMessage));
    }, (authModel) {
      if (authModel.status!) {
        SharedPreference.setData(
          key: "token",
          value: authModel.data!.token,
        ).then((value) {
          token = authModel.data!.token;
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Success Register"),
            backgroundColor: Colors.green,
          ));
          if (!Platform.isWindows) {
            showToast(
              message: "Success Register",
              state: ToastStates.success,
            );
          }
          navigateAndFinish(context, const LayoutView());
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(authModel.message!),
          backgroundColor: Colors.red,
        ));
        if (!Platform.isWindows) {
          showToast(
            message: authModel.message!,
            state: ToastStates.error,
          );
        }
      }
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
