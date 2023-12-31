import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/core/utils/styles.dart';



class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.buttonName,
      this.onPressed,
       this.height,
       this.width=double.infinity,
       this.radius, this.style,
      })
      : super(key: key);

  final String buttonName;
  final void Function()? onPressed;
  final double ?height;
  final double ?width;
  final double ?radius;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 66.h,
        width: width ?? double.infinity,

        decoration:  BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.center,
              end: Alignment.centerLeft,
              colors: [
                kPrimaryColor,
               Color(0x854f6c99),

          ],
          ),
          borderRadius: BorderRadius.circular(
          radius ?? 32.w,
        ),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: style ?? Styles.textStyle20.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
