import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/core/utils/functions/navigator_push.dart';

import 'package:swifit_cart/core/utils/styles.dart';
import 'package:swifit_cart/core/widgets/custom_button.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/auth/presentation/views/widgets/create_new_password_text_field_sec.dart';
import 'package:swifit_cart/features/home/presentation/view/home_view.dart';


class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});

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
                "Create new password",
                style: Styles.textStyle25,
              ),
              const ResponsiveSizedBox(
                height: 16,
              ),
              Text(
                "Enter your new password",
                style: Styles.textStyle16.copyWith(
                  color: kB60Color,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const ResponsiveSizedBox(
                height: 40,
              ),
              const CreateNewPasswordTextFieldsSec(),
              const ResponsiveSizedBox(
                height: 40,
              ),
              CustomButton(
                buttonName: "Reset",
                onPressed: () {
                  navigatorPush(const HomeView(), context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
