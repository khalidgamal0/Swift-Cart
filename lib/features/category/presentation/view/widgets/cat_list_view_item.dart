import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant.dart';
import '../../../../../core/utilis/assets.dart';
import '../../../../../core/utilis/styles.dart';

class CatListViewItem extends StatelessWidget {
  const CatListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      margin: EdgeInsets.symmetric(horizontal: 23.w),
      width: 344.w,
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color(0xff2A132E).withOpacity(.05)),
        borderRadius: BorderRadius.circular(8),
        color: kSecondaryColor,

      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AssetsData.watch),
            SizedBox(width: 16.w,),
            Text('watch', style: Styles.textStyle18,),
            const Spacer(),
            IconButton(onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios_sharp)),
            SizedBox(width: 20.w,),

          ]),
    );
  }
}
