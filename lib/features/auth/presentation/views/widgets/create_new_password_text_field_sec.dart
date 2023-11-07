import 'package:flutter/material.dart';
import 'package:swifit_cart/core/widgets/custom_text_form_field.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/core/widgets/text_filed_name.dart';

class CreateNewPasswordTextFieldsSec extends StatelessWidget {
  const CreateNewPasswordTextFieldsSec({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        TextFieldName(name: "New Password"),
        CustomTextFormField(
          hintText: "New Password",
        ),
        ResponsiveSizedBox(
          height: 20,
        ),
        TextFieldName(name: "Confirm Password"),
        CustomTextFormField(
          hintText: "Confirm Password",
        ),
      ],
    );
  }
}
