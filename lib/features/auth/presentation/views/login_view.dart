import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/core/utils/styles.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/auth/presentation/manager/auth_cubit.dart';
import 'package:swifit_cart/features/auth/presentation/views/widgets/login_reset_password_to_end_sec.dart';
import 'package:swifit_cart/features/auth/presentation/views/widgets/login_text_form_fields_sec.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
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
                key: cubit.formKey,
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
                      // S.of(context).title,
                      "Welcome Back !",
                      style: Styles.textStyle25,
                    ),
                    const ResponsiveSizedBox(
                      height: 40,
                    ),
                    LoginTextFormFieldsSec(
                      emailController: cubit.loginEmailController,
                      passwordController: cubit.loginPassController,
                      cubit: cubit,
                    ),
                    const ResponsiveSizedBox(
                      height: 15,
                    ),
                    LoginResetPasswordToEndSec(
                      condition: state is LoginLoading,
                      onPressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.userLogin(
                              context:context,);
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
    );
  }
}
