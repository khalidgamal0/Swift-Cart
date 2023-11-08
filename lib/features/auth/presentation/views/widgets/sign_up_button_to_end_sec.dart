import 'package:flutter/material.dart';
import 'package:swifit_cart/core/constant.dart';
import 'package:swifit_cart/core/utils/functions/navigator_push.dart';
import 'package:swifit_cart/core/utils/styles.dart';
import 'package:swifit_cart/core/widgets/custom_button.dart';
import 'package:swifit_cart/core/widgets/custom_text_button.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/auth/presentation/views/login_view.dart';
import 'package:swifit_cart/features/layout/layout_view.dart';

class SignUpButtonToEndSec extends StatelessWidget {
  const SignUpButtonToEndSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          buttonName: "Sign up",
          onPressed: () {
            navigatorPush(const LayoutView(), context);
          },
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
                navigatorPush(const LoginView(), context);
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
