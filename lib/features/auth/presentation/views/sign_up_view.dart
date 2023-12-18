import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/core/utils/service_locator.dart';
import 'package:swifit_cart/core/utils/shared_prefrence.dart';
import 'package:swifit_cart/core/utils/functions/navigate.dart';
import 'package:swifit_cart/core/utils/styles.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/core/widgets/toast.dart';
import 'package:swifit_cart/features/auth/data/repos/auth_repo_implementaion.dart';
import 'package:swifit_cart/features/auth/presentation/views/widgets/sign_up_button_to_end_sec.dart';
import 'package:swifit_cart/features/auth/presentation/views/widgets/sign_up_or_sec.dart';
import 'package:swifit_cart/features/auth/presentation/views/widgets/sign_up_text_form_field_sec.dart';
import 'package:swifit_cart/features/layout/layout_view.dart';

import '../manager/auth_cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            if (state.signUpModel.status!) {
              SharedPreference.setData(
                key: "token",
                value: state.signUpModel.data!.token,
              ).then((value) {
                token = state.signUpModel.data!.token;
                showToast(
                  message: "Success Register",
                  state: ToastStates.success,
                );
                navigateAndFinish(context, const LayoutView());
              });
            } else {
              showToast(
                  message: state.signUpModel.message!, state: ToastStates.error);
            }
          } else if(state is SignUpFailure) {
            showToast(
                message: state.errorMessage.toString(),
                state: ToastStates.error);
          }
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                    top: 17.h, bottom: 53.h, right: 23.w, left: 23.w),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Join us now !",
                        style: Styles.textStyle25,
                      ),
                      const ResponsiveSizedBox(
                        height: 46,
                      ),
                      SignUpTextFormFieldsSec(
                        phoneController: phoneController,
                        cubit: cubit,
                        emailController: emailController,
                        nameController: nameController,
                        passwordController: passController,
                      ),
                      const ResponsiveSizedBox(
                        height: 32,
                      ),
                      const SignUpOrSec(),
                      const ResponsiveSizedBox(
                        height: 32,
                      ),
                      SignUpButtonToEndSec(
                        condition: state is SignUpLoading,
                        onPressed: () async {
                          print(emailController.text+passController.text+phoneController.text+nameController.text);
                          if (formKey.currentState!.validate()) {
                            await cubit.signUp(
                              email: emailController.text,
                              password: passController.text,
                              phone: phoneController.text,
                              name: nameController.text,
                            );
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
