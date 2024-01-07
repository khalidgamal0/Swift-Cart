import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/resposive_size_config.dart';
import '../../../../../core/widgets/responsive_sized_box.dart';

class FavoriteViewLoading extends StatelessWidget {
  const FavoriteViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(vertical: 8.h, horizontal: 14.w),
        height: 130.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(8.w),
        ),
        child: Row(
          children: [
            Container(
              width: 96.w,
              height: 104.h,
              color: Colors.white,
            ),
            const ResponsiveSizedBox(width: 16),
            SizedBox(
              width: SizeConfig.width(context, 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25.0.h, bottom: 5.h),
                    child: Container(
                      width: double.infinity,
                      height: 12.h,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.w),
                    child: Container(
                      width: double.infinity,
                      height: 16.h,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 24.w,
                height: 24.w,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
