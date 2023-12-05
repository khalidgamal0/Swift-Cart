import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/core/utils/functions/navigate.dart';
import 'package:swifit_cart/core/utils/shared_prefrence.dart';
import 'package:swifit_cart/core/utils/styles.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/core/widgets/toast.dart';
import 'package:swifit_cart/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:swifit_cart/features/auth/presentation/views/widgets/login_reset_password_to_end_sec.dart';
import 'package:swifit_cart/features/auth/presentation/views/widgets/login_text_form_fields_sec.dart';
import 'package:swifit_cart/features/layout/layout_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            if (state.loginModel.status) {
              SharedPreference.setData(
                key: "token",
                value: state.loginModel.data.token,
              ).then(
                (value) {
                  token = state.loginModel.data.token;
                  showToast(
                    message: "Success Login",
                    state: ToastStates.success,
                  );
                  navigateAndFinish(
                    context,
                    const LayoutView(),
                  );
                },
              );
            } else {
              showToast(
                message: state.loginModel.message,
                state: ToastStates.error,
              );
            }
          } else if (state is LoginFailure){
            showToast(message: "some thing is wrong please check email and password", state: ToastStates.error);
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                  top: 17.h,
                  bottom: 53.h,
                  right: 23.w,
                  left: 23.w,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_outlined,
                            size: 24.w,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      const ResponsiveSizedBox(
                        height: 40,
                      ),
                      Text(
                        "Welcome Back !",
                        style: Styles.textStyle25,
                      ),
                      const ResponsiveSizedBox(
                        height: 40,
                      ),
                       LoginTextFormFieldsSec(
                        emailController: emailController,
                        passwordController: passController,
                         cubit: cubit,
                      ),
                      const ResponsiveSizedBox(
                        height: 15,
                      ),
                       LoginResetPasswordToEndSec(
                         condition: state is LoginLoading,
                       onPressed:  () {
                         if(formKey.currentState!.validate()){
                           cubit.userLogin(email: emailController.text, password: passController.text);
                         }
                       },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
