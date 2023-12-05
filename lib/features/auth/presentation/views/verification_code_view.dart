import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/core/utils/styles.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/auth/presentation/views/widgets/verification_code_otp_to_end_sec.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({super.key});

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
                "Verification code",
                style: Styles.textStyle25,
              ),
              const ResponsiveSizedBox(
                height: 16,
              ),
              Text(
                "We sent you 4 numbers as a \nverification code",
                textAlign: TextAlign.center,
                style: Styles.textStyle16.copyWith(
                  color: kB60Color,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const ResponsiveSizedBox(
                height: 40,
              ),
              const VerificationCodeOTPToEndSec(),
            ],
          ),
        ),
      ),
    );
  }
}
