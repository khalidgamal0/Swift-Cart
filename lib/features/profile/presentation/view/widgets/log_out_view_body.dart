import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/constant.dart';
import 'package:swifit_cart/core/utils/assets.dart';
import 'package:swifit_cart/core/utils/styles.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/profile/presentation/view/widgets/log_out_view_buttons_sec.dart';

class LogOutViewBody extends StatelessWidget {
  const LogOutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:59.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsData.phone,
            width: 100.w,
            height: 48.h,
            fit: BoxFit.fill,
          ),
          const ResponsiveSizedBox(
            height: 32,
          ),
          Text(
            "Are you sure you want to log out ?",
            style: Styles.textStyle20,
            textAlign: TextAlign.center,
          ),
          const ResponsiveSizedBox(
            height: 32,
          ),
          Text(
            "If you logged out you would need to re-enter the Email and passord if you want to enter again. ",
            style: Styles.textStyle12.copyWith(
              color: kB60Color,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          const ResponsiveSizedBox(
            height: 40,
          ),
          const LogOutViewButtonsSec(),



        ],
      ),
    );
  }
}
