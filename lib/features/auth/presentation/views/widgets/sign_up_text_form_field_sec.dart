import 'package:flutter/material.dart';
import 'package:swifit_cart/core/widgets/custom_text_form_field.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/core/widgets/text_filed_name.dart';
import 'package:swifit_cart/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';

class SignUpTextFormFieldsSec extends StatelessWidget {
  const SignUpTextFormFieldsSec({super.key, this.nameController, this.emailController, this.passwordController, required this.cubit, this.phoneController});
  final TextEditingController? nameController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TextEditingController? phoneController;
  final SignUpCubit cubit;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const TextFieldName(name: "Full Name"),
        CustomTextFormField(
          hintText: "Full Name",
          controller: nameController,
          type: TextInputType.name,
          validate: (value){
            if(value!.isEmpty){
              return "Required name";
            }
            return null;
          },
        ),
        const ResponsiveSizedBox(
          height: 12,
        ),
        const TextFieldName(name: "Phone"),
        CustomTextFormField(
          hintText: "Phone",
          controller: phoneController,
          type: TextInputType.phone,
          validate: (value){
            if(value!.isEmpty){
              return "Required phone";
            }
            return null;
          },

        ),
        const ResponsiveSizedBox(
          height: 12,
        ),
        const TextFieldName(name: "Email Address",),
        CustomTextFormField(
          hintText: "Email Address",
          controller: emailController,
          type: TextInputType.emailAddress,
          validate: (value){
            if(value!.isEmpty){
              return "Required email";
            }
            return null;
          },
        ),
        const ResponsiveSizedBox(
          height: 12,
        ),
        const TextFieldName(name: "Password"),
        CustomTextFormField(
          hintText: "Password",
          controller: passwordController,
          suffixPressed: () {
            cubit.changePasswordVisibility();
          },
          type: TextInputType.visiblePassword,
          validate: (value){
            if(value!.isEmpty){
              return "Required password";
            }
            return null;
          },
          suffix: cubit.suffix,
          isPassword: cubit.isPassword,
        ),
      ],
    );
  }
}
