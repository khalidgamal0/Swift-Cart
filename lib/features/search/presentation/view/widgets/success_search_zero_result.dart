import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/responsive_sized_box.dart';

class SuccessSearchZeroResult extends StatelessWidget {
  const SuccessSearchZeroResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const ResponsiveSizedBox(
            height: 250,
          ),
          Image.asset(
            AssetsData.phone,
            width: 100.w,
            height: 48.h,
            fit: BoxFit.fill,
          ),
          const ResponsiveSizedBox(
            height: 32,
          ),
          Text(
            "Please enter a suitable word",
            style: Styles.textStyle20,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
