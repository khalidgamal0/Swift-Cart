import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/core/utils/functions/navigator_push.dart';
import 'package:swifit_cart/core/utils/styles.dart';
import 'package:swifit_cart/core/widgets/custom_button.dart';
import 'package:swifit_cart/core/widgets/custom_circular_indicator.dart';
import 'package:swifit_cart/core/widgets/custom_text_button.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/auth/presentation/views/reset_password_view.dart';

class LoginResetPasswordToEndSec extends StatelessWidget {
  const LoginResetPasswordToEndSec({super.key, this.onPressed, required this.condition});
 final bool condition;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: CustomTextButton(
            textStyle: Styles.textStyle12.copyWith(
              color: kB60Color,
            ),
            text: "Reset password",
            onPressed: () {
              navigatorPush(ResetPasswordView(), context);
            },
          ),
        ),
        const ResponsiveSizedBox(
          height: 35,
        ),
        ConditionalBuilder(
          builder: (context) => CustomButton(
            buttonName: "Log In",
            onPressed: onPressed,
          ),
          condition: !condition,
          fallback: (context) =>  CustomCircularIndicator(
            height: 30.h,
            color: kPrimaryColor,
            width: 30.w,
          ),
        ),
        const ResponsiveSizedBox(
          height: 250,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'By continuing, you agree to our ',
                style: Styles.textStyle12.copyWith(
                  color: kB60Color,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: "Terms,Community Guidelines & Privacy policy",
                style: Styles.textStyle12.copyWith(
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
