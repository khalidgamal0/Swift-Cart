import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/utils/service_locator.dart';
import 'package:swifit_cart/core/utils/styles.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/auth/data/repos/auth_repo_implementaion.dart';
import 'package:swifit_cart/features/auth/presentation/views/widgets/sign_up_button_to_end_sec.dart';
import 'package:swifit_cart/features/auth/presentation/views/widgets/sign_up_or_sec.dart';
import 'package:swifit_cart/features/auth/presentation/views/widgets/sign_up_text_form_field_sec.dart';
import '../manager/auth_cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
                  top: 17.h, bottom: 53.h, right: 23.w, left: 23.w),
              child: Form(
                key: cubit.formKey,
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
                      phoneController: cubit.phoneController,
                      cubit: cubit,
                      emailController: cubit.emailController,
                      nameController: cubit.nameController,
                      passwordController: cubit.passController,
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
                        if (cubit.formKey.currentState!.validate()) {
                          await cubit.signUp(
                            context: context,
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
    );
  }
}
