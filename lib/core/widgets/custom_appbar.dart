import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant.dart';
import '../utils/styles.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key, required this.text,
    this.icon,
  });

  final String text;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64.h,
      color: kSecondaryColor,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          width: 24.w,
        ),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_circle_left_outlined)),
        SizedBox(
          width: 96.w,
        ),
        Text(
          text,
          style: Styles.textStyle18,
        ),
        const Spacer(),
        Icon(icon,color: kPrimaryColor,),
        SizedBox(
          width:21.w,
        ),

      ]),
    );
  }
}
