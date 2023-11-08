import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/constant.dart';

class CustomAddRemoveContainer extends StatelessWidget {
  const CustomAddRemoveContainer({super.key, this.icon});

  final  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.w,
      width: 24.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.w),
        border: Border.all(
          color: kB60Color,
          width: 1.7.w,
        ),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 20.w,
         color:    kB60Color,
        ),
      ),
    );
  }
}
