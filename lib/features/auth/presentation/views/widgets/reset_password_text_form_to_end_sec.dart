import 'package:flutter/cupertino.dart';
import 'package:swifit_cart/core/constant.dart';
import 'package:swifit_cart/core/utilis/functions/navigator_push.dart';
import 'package:swifit_cart/core/utilis/styles.dart';
import 'package:swifit_cart/core/widgets/custom_button.dart';
import 'package:swifit_cart/core/widgets/custom_text_form_field.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/auth/presentation/views/verification_code_view.dart';
import 'package:swifit_cart/features/auth/presentation/views/widgets/text_filed_name.dart';

class ResetPasswordTextFormToEndSec extends StatelessWidget {
  const ResetPasswordTextFormToEndSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextFieldName(name: "Email Address"),
        const CustomTextFormField(
          hintText: "Email Address",
        ),
        const ResponsiveSizedBox(
          height: 40,
        ),
        CustomButton(
          buttonName: "Next",
          onPressed: () {
            navigatorPush(const VerificationCodeView(), context);
          },
        ),
        const ResponsiveSizedBox(
          height: 330,
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
