import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/constant.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/auth/presentation/views/create_new_password_view.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:swifit_cart/core/utilis/functions/navigator_push.dart';
import 'package:swifit_cart/core/utilis/styles.dart';
import 'package:swifit_cart/core/widgets/custom_button.dart';
import 'package:swifit_cart/core/widgets/custom_text_button.dart';

class VerificationCodeOTPToEndSec extends StatelessWidget {
  const VerificationCodeOTPToEndSec({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        OTPTextField(
          otpFieldStyle: OtpFieldStyle(
            focusBorderColor: kPrimaryColor,
          ),
          length: 4,
          width: MediaQuery.of(context).size.width,
          textFieldAlignment: MainAxisAlignment.center,
          fieldWidth: 72.w,
          spaceBetween: 16.w,
          fieldStyle: FieldStyle.box,
          outlineBorderRadius: 12.w,
        ),
        const ResponsiveSizedBox(
          height: 40,
        ),
        CustomButton(
          buttonName: "Confirm",
          onPressed: () {
            navigatorPush(const CreateNewPasswordView(), context);
          },
        ),
        const ResponsiveSizedBox(
          height: 40,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: CustomTextButton(
            textStyle: Styles.textStyle12.copyWith(
              color: kB60Color,
            ),
            text: "resend code?",
          ),
        ),
        const ResponsiveSizedBox(
          height: 8,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: CustomTextButton(
            textStyle: Styles.textStyle12.copyWith(
              color: kB60Color,
            ),
            text: "edit email?",
          ),
        ),
      ],
    );
  }
}
