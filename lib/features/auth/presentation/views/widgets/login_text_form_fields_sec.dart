import 'package:flutter/material.dart';
import 'package:swifit_cart/core/widgets/custom_text_form_field.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/core/widgets/text_filed_name.dart';
import '../../manager/auth_cubit.dart';

class LoginTextFormFieldsSec extends StatelessWidget {
  const LoginTextFormFieldsSec({super.key, this.emailController, this.passwordController, required this.cubit});
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {

    return  Column(
     children: [
       const TextFieldName(name: "Email Address"),
       CustomTextFormField(
         hintText: "Email Address",
         controller: emailController,
         type: TextInputType.emailAddress,
         validate: (value) {
           if(value!.isEmpty){
             return "Required Email";
           }
           return null;

         },

       ),
       const ResponsiveSizedBox(
         height: 12,
       ),
       const TextFieldName(name: "Password"),
       CustomTextFormField(
         suffixPressed: () {
           cubit.changePasswordVisibility();
         },
         hintText: "Password",
         controller: passwordController,
         isPassword: cubit.isPassword,
         suffix: cubit.suffix,
         validate: (value) {
           if(value!.isEmpty){
             return "Required password";
           }
           return null;
         },
       ),
     ],
    );
  }
}
