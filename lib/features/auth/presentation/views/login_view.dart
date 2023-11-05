import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/constant.dart';
import 'package:swifit_cart/core/utilis/styles.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/auth/presentation/views/widgets/login_reset_password_to_end_sec.dart';
import 'package:swifit_cart/features/auth/presentation/views/widgets/login_text_form_fields_sec.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding:
              EdgeInsets.only(top: 17.h, bottom: 53.h, right: 23.w, left: 23.w),
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
              const LoginTextFormFieldsSec(),
              const ResponsiveSizedBox(
                height: 15,
              ),
              const LoginResetPasswordToEndSec(),
            ],
          ),
        ),
      ),
    );
  }
}
