import 'dart:developer';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/core/utils/functions/navigator_push.dart';
import 'package:swifit_cart/core/utils/styles.dart';
import 'package:swifit_cart/core/widgets/custom_button.dart';
import 'package:swifit_cart/core/widgets/custom_text_button.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/auth/presentation/views/login_view.dart';

import '../../../../../core/widgets/custom_circular_indicator.dart';

class SignUpButtonToEndSec extends StatelessWidget {
  const SignUpButtonToEndSec({super.key, this.onPressed, required this.condition});
  final void Function()? onPressed ;
  final bool condition;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConditionalBuilder(
          condition: !condition,
          builder:(context) => CustomButton(
            buttonName: "Sign up",
            onPressed: onPressed
          ),
          fallback:  (context) => CustomCircularIndicator(
            height: 30.h,
            color: kPrimaryColor,
            width: 30.w,
          ),
        ),
        const ResponsiveSizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "have an account ?",
              style: Styles.textStyle18.copyWith(
                color: kB60Color,
                fontWeight: FontWeight.w400,
              ),
            ),
            const ResponsiveSizedBox(
              width: 16,
            ),
            CustomTextButton(
              text: "log in",
              onPressed: () {
                log('jjjjjjjjjjjjj');Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView(),));
              },
            ),
          ],
        ),
        const ResponsiveSizedBox(
          height: 32,
        ),
        RichText(
          text: TextSpan(children: [
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
          ]),
        ),
      ],
    );
  }
}
