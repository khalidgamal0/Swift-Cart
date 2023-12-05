import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';

class ProductGridViewItem extends StatelessWidget {
  const ProductGridViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 159.w,
      height: 257.h,
      decoration: BoxDecoration(
        border:
        Border.all(color: const Color(0xff2A132E).withOpacity(.5)),
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xff2A132E).withOpacity(.1),
      ),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8.0.h, left:8.w,right: 7.w,top: 8.h),
          child: Row(
            children: [
              Icon(
                Icons.bookmark_outline,
                size: 20.w,
              ),
              const Spacer(),
              Icon(
                Icons.add_box_rounded,
                size: 20.w,
              ),
            ],
          ),
        ),
        Image.asset(
          AssetsData.laptop,
          height: 144.h,
          width: 144.w,
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 8.0.w,right: 6.w),
              child: Text(
                '593.97 \$',
                style: Styles.textStyle12.copyWith(
                  decoration: TextDecoration.lineThrough,
                  height: 1.2.h,
                ),
              ),
            ),
            Text(
              '593.97 \$',
              style: Styles.textStyle12.copyWith(
                color: kPrimaryColor,
                height: 1.2.h,

              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 6,
            bottom: 8,
          ),
          child: SizedBox(
            height: 38.h,
            child: Text(
              'HP Newest 14" Ultral Light Laptop',
              style: Styles.textStyle12,
            ),
          ),
        )
      ]),
    );
  }
}
