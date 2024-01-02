import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/features/profile/presentation/view/widgets/profile_contianer_item.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h, left: 23.5.w, right: 23.5.w),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(8.w),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
          child: const ProfileContainerItem()),
    );  }
}

