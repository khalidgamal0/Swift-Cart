import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constant.dart';
import '../../../../../core/utilis/styles.dart';

class FirstSection extends StatelessWidget {
  const FirstSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:27.w,right:27.w,top:24.h),
      child: Row(
        children: [
          Container(
            width: 169.w,
            height: 35.h,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color(0xff2A132E).withOpacity(.5)),
              borderRadius: BorderRadius.circular(8),
              color:const Color(0xff2A132E).withOpacity(.1),
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Ascending price', style: Styles.textStyle12),
                  SizedBox(
                    width: 8.w,
                  ),
                  const Icon(
                    Icons.arrow_downward,
                    size: 16,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  const Icon(
                    Icons.arrow_upward,
                    size: 16,
                    color: kPrimaryColor,
                  ),
                ]),
          ),
          const Spacer(),
          Text(
            'Filters',
            style: Styles.textStyle12,
          ),
          SizedBox(
            width: 1.5.w,
          ),
          Icon(
            Icons.dashboard_rounded,
            size: 16,
            color: kPrimaryOpacityColor,
          )
        ],
      ),
    );
  }
}
