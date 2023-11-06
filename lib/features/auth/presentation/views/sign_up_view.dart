import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/utilis/styles.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/auth/presentation/views/widgets/sign_up_button_to_end_sec.dart';
import 'package:swifit_cart/features/auth/presentation/views/widgets/sign_up_or_sec.dart';
import 'package:swifit_cart/features/auth/presentation/views/widgets/sign_up_text_form_field_sec.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
              Text(
                "Join us now !",
                style: Styles.textStyle25,
              ),
              const ResponsiveSizedBox(
                height: 46,
              ),
              const SignUpTextFormFieldsSec(),
              const ResponsiveSizedBox(
                height: 32,
              ),
              const SignUpOrSec(),
              const ResponsiveSizedBox(
                height: 32,
              ),
              const SignUpButtonToEndSec(),
            ],
          ),
        ),
      ),
    );
  }
}
