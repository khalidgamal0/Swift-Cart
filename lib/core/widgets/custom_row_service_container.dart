import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/constant.dart';
import 'package:swifit_cart/core/utils/styles.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';

class CustomRowServiceContainer extends StatelessWidget {
  const CustomRowServiceContainer({
    super.key,
 this.onPressed,
    required this.name,
    required this.iconName,
  });

  final void Function()? onPressed;
  final String name;
  final IconData iconName;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          iconName,
          color: Colors.black54,
          size: 26.w,
        ),
        const ResponsiveSizedBox(
          width: 24,
        ),
        Text(
          name,
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.w400,
            color: kB60Color,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onPressed,
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 20.w,
            color: kPrimaryColor,
          ),
        )
      ],
    );
  }
}
