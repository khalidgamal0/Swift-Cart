import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/constant.dart';
import 'package:swifit_cart/core/utilis/assets.dart';
import 'package:swifit_cart/core/utilis/resposive_size_config.dart';
import 'package:swifit_cart/core/utilis/styles.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';

class SignUpOrSec extends StatelessWidget {
  const SignUpOrSec({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(
          "or",
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.w400,
            color: kB60Color,
          ),
        ),
        const ResponsiveSizedBox(
          height: 8,
        ),
        Text(
          "sign in with",
          style: Styles.textStyle18.copyWith(
            color: kB60Color,
          ),
        ),
        const ResponsiveSizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              AssetsData.google,
              width: 32.w,
              height: 33.03.h,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: SizeConfig.height(context, 48),
              child: VerticalDivider(
                color: kB60Color,
                thickness: 1.w,
                width: 0.5.w,
              ),
            ),
            Image.asset(
              AssetsData.facebook,
              width: 32.w,
              height: 33.03.h,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ],
    );
  }
}
