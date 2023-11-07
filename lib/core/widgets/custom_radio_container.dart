import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/constant.dart';
import 'package:swifit_cart/core/utilis/styles.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';

class CustomRadioContainer extends StatelessWidget {
  const CustomRadioContainer({
    super.key,
    this.onPressed,
    required this.name,
    required this.leading, required this.isSelected,
  });

  final void Function()? onPressed;
  final String name;
  final String leading;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          const ResponsiveSizedBox(
            height:10 ,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                leading,
                style: Styles.textStyle18
                    .copyWith(fontWeight: FontWeight.w400, color: kB60Color),
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
              if(isSelected ==true)
                Icon(
                  Icons.check,
                  size: 20.w,
                  color: kPrimaryColor,
                )
            ],
          ),
          const ResponsiveSizedBox(
            height:10 ,
          ),

          Divider(
            thickness: 0.5.w,
            color: kB60Color,
          ),



        ],
      ),
    );
  }
}
