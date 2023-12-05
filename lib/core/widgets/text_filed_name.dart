import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/core/utils/styles.dart';

class TextFieldName extends StatelessWidget {
  const TextFieldName({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          name,
          style: Styles.textStyle16.copyWith(
            color: kPrimaryColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
