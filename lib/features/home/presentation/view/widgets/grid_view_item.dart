import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant.dart';
import '../../../../../core/utilis/assets.dart';
import '../../../../../core/utilis/styles.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: 160.w,
      decoration: BoxDecoration(
        border: Border.all(color:Colors.grey),
        borderRadius: BorderRadius.circular(8.r),
        color: kSecondaryColor,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Text(
                '-50%',
                style: Styles.textStyle12.copyWith(color: Colors.red),
              ),
            ),
            Center(
              child: Image.asset(
                AssetsData.watch,
                width: 144.w,
                height: 144.h,
                scale: .2,
              ),
            ),
            SizedBox(height: 40.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(children: [
                Text('laptop',style: Styles.textStyle16,),
                const Spacer(),
                Text('149\$',style: Styles.textStyle16,),
              ],),
            )
          ]),
    );
  }
}
