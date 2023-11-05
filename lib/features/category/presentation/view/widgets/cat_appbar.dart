import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant.dart';
import '../../../../../core/utilis/styles.dart';

class CatAppbar extends StatelessWidget {
  const CatAppbar({
    super.key,
  });

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
          'Category',
          style: Styles.textStyle18,
        ),
      ]),
    );
  }
}
