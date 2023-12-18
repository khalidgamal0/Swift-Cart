import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class ProfileApproachFields extends StatelessWidget {
  ProfileApproachFields({
    super.key,
    required this.text,
    this.hintText = '',
    this.maxLines = 1,
    this.suffix,
    this.suffixIconColor = Colors.grey,
     this.controller, this.validate,
  });

  final String text;
  final String hintText;
  final int maxLines;
  IconData? suffix;
  final Color suffixIconColor;
  final TextEditingController? controller;
  final String? Function(String?)? validate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Styles.textStyle16,
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextFormField(
          validate: validate,
          controller: controller,
          maxLines: maxLines,
          hintText: hintText,
        ),
        const SizedBox(
          height: 18,
        ),
      ],
    );
  }
}
