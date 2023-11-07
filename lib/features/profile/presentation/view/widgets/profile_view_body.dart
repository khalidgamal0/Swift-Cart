import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/constant.dart';
import 'package:swifit_cart/core/utilis/functions/navigator_push.dart';
import 'package:swifit_cart/core/widgets/custom_row_service_container.dart';
import 'package:swifit_cart/features/profile/data/models/profile_service_model.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 25.h),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CustomRowServiceContainer(
              name: ProfileServiceModel.serviceList[index].name,
              iconName: ProfileServiceModel.serviceList[index].iconName,
              onPressed: () {
                navigatorPush(ProfileServiceModel.serviceList[index].navigaterPage, context);
              },
            );
          }, itemCount: ProfileServiceModel.serviceList.length,
          separatorBuilder: (BuildContext context, int index) {
            return Padding(
              padding:  EdgeInsets.symmetric(vertical: 24.h),
              child: Divider(
                height: 1.h,
                color: kB60Color,
                thickness: 1.w,
              ),
            );
          },
        ),
      ),
    );
  }
}
