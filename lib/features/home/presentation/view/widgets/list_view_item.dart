import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            SizedBox(height: 14.h,),
            Container(
              width: 80.w,
              height: 88.h,
              alignment:Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 14.h),
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color(
                      0xff2A132E,
                    )),
                borderRadius: BorderRadius.circular(9.89.r),

              ),
              child: Text('Iphone',style: Styles.textStyle12,),
            ),
          ],
        ),
        Image.asset(AssetsData.watch),
      ],
    );
  }
}
