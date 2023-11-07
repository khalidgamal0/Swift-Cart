import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/widgets/custom_button.dart';
import 'package:swifit_cart/core/widgets/custom_text_form_field.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/core/widgets/text_filed_name.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.w),
        child: const Column(
          children: [
            ResponsiveSizedBox(
              height: 40,
            ),
            TextFieldName(name: "Full Name"),
            CustomTextFormField(
              hintText: "Full Name",
            ),
            ResponsiveSizedBox(
              height: 18,
            ),
            TextFieldName(name: "Email Address"),
            CustomTextFormField(
              hintText: "Email Address",
            ),
            ResponsiveSizedBox(
              height: 18,
            ),
            TextFieldName(name: "Password"),
            CustomTextFormField(
              hintText: "Password",
            ),
            ResponsiveSizedBox(
              height: 160,
            ),
            CustomButton(
              buttonName: "Save changes",
            ),
          ],
        ),
      ),
    );
  }
}
