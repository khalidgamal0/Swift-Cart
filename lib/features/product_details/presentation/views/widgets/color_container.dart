import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant.dart';
import '../../../../../core/utils/styles.dart';

class ColorContainerItem extends StatelessWidget {
  const ColorContainerItem({
    super.key, required this.color, required this.text, required this.width,
  });
  final Color color;
  final String text;
  final double width;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: 35.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: kSecondaryColor,


      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
              child:  CircleAvatar(radius: 8,
                backgroundColor: color,
              ),
            ),

            Text(text,style: Styles.textStyle12.copyWith(color: kPrimaryColor.withOpacity(.75)),)
          ]),
    );
  }
}
