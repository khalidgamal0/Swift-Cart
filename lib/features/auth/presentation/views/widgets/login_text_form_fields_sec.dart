import 'package:flutter/material.dart';
import 'package:swifit_cart/core/widgets/custom_text_form_field.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/auth/presentation/views/widgets/text_filed_name.dart';

class LoginTextFormFieldsSec extends StatelessWidget {
  const LoginTextFormFieldsSec({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
     children: [
       TextFieldName(name: "Email Address"),
       CustomTextFormField(
         hintText: "Email Address",
       ),
       ResponsiveSizedBox(
         height: 12,
       ),
       TextFieldName(name: "Password"),
       CustomTextFormField(
         hintText: "Password",
       ),
     ],
    );
  }
}
