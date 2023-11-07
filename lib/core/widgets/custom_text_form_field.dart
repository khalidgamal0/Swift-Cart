import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant.dart';
import '../utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      this.controller,
      this.isPassword = false,
      this.type,
      this.isClickable = true,
      this.onSubmit,
      this.onChange,
      this.onTap,
      this.validate,
      this.hintText,
      this.suffix,
      this.suffixPressed,
      this.maxLines = 1,
      this.disabledBorderColor = const Color(0xffF4F4F4),
      this.enabledBorderColor = const Color(0xffF4F4F4),
      this.focusedBorderColor = kPrimaryColor,
      this.fillColor = const Color(0xffF4F4F4),
      this.boarderRadius,
      this.prefix,
      this.prefixColor,
      this.labelText})
      : super(key: key);

  final TextEditingController? controller;
  final TextInputType? type;
  final void Function(String)? onSubmit;
  final void Function(String)? onChange;
  final void Function()? onTap;
  final bool isPassword;
  final String? Function(String?)? validate;
  final String? hintText;
  final String? labelText;
  final IconData? suffix;
  final IconData? prefix;
  final void Function()? suffixPressed;
  final bool isClickable;
  final int maxLines;
  final double ?boarderRadius;
  final Color disabledBorderColor;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final Color fillColor;
  final Color? prefixColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Styles.textStyle12.copyWith(fontWeight: FontWeight.w400),
      maxLines: maxLines,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        prefixIcon: prefix != null
            ? Icon(
                prefix,
                color: prefixColor,
              )
            : null,
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(boarderRadius ??  24.w),
            borderSide: BorderSide(
              color: disabledBorderColor,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(boarderRadius ??  24.w,),
            borderSide: BorderSide(color: enabledBorderColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(boarderRadius ??  24.w),
            borderSide: BorderSide(color: focusedBorderColor)),
        hintText: hintText,
        labelText: labelText,
        labelStyle: Styles.textStyle16.copyWith(color: kPrimaryColor,fontWeight: FontWeight.w400),
        hintStyle: Styles.textStyle12.copyWith(color:  kB60Color,fontWeight: FontWeight.w400),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
