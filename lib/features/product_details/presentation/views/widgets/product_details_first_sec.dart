import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/responsive_sized_box.dart';

class ProductDetailsFirstSec extends StatelessWidget {
  const ProductDetailsFirstSec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Image.asset(
              AssetsData.laptop,
              width: 390.w,
              height: 226.h,
            ),
            IconButton(onPressed: (){}, icon:  Icon(Icons.bookmark_outline,size: 28.w,))
          ],
        ),
        const ResponsiveSizedBox(
          height: 15,
        ),
        Text(
          '2022 Apple iPad Air 10.9"',
          style: Styles.textStyle18,
        ),
        const ResponsiveSizedBox(
          height: 8,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0.w, right: 8.w),
              child: Text(
                '593.97 \$',
                style: Styles.textStyle12.copyWith(
                  color: kPrimaryColor.withOpacity(.75),
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
            ),
            const Spacer(),
            Icon(
              Icons.remove_from_queue_outlined,
              size: 24.w,
            ),
            ResponsiveSizedBox(
              width: 8.w,
            ),
            Text(
              '1',
              style: Styles.textStyle16,
            ),
            ResponsiveSizedBox(
              width: 8.w,
            ),
            Icon(
              Icons.add_box_outlined,
              size: 24.w,
            ),
          ],
        ),
        const ResponsiveSizedBox(
          height: 22,
        ),
        Divider(
          height: 1,
          color: kPrimaryColor.withOpacity(.25),
        ),
        const ResponsiveSizedBox(
          height: 16,
        ),
        Text(
          'Colors',
          style: Styles.textStyle18.copyWith(
            fontWeight: FontWeight.w400,
            color: kPrimaryColor.withOpacity(.75),
          ),
        ),
        const ResponsiveSizedBox(
          height: 8,
        ),
      ],
    );
  }
}
