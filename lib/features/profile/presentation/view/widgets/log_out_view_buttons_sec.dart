import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/core/utils/functions/navigator_push.dart';
import 'package:swifit_cart/core/utils/styles.dart';
import 'package:swifit_cart/core/widgets/custom_button.dart';
import 'package:swifit_cart/features/auth/presentation/views/sign_up_view.dart';

import '../../../../../core/utils/shared_prefrence.dart';
import '../../manger/account/account_cubit.dart';

class LogOutViewButtonsSec extends StatelessWidget {
  const LogOutViewButtonsSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            SharedPreference.removeData(key: 'token').then((value)async =>{
             await AccountCubit.get(context).logOutAccount(),
                navigatorPush(const SignUpView(), context)
            });
          },
          child: Container(
            width: 130.w,
            height: 63.h,
            decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(
                  32.w,
                ),
                border: Border.all(color: kPrimaryColor, width: 1.w)),
            child: Center(
              child: Text(
                "Log Out",
                style: Styles.textStyle18.copyWith(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        CustomButton(
          onPressed: () {
            Navigator.pop(context);
          },
          buttonName: "Cancel",
          width: 130.w,
          height: 63.h,
          style: Styles.textStyle18.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
