import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/constant.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Center(
      child: SmoothPageIndicator(
        controller: PageController(),
        count: 3,
        effect: WormEffect(
          activeDotColor: kPrimaryColor,
          dotWidth: 8.w,
          dotHeight: 8.h,
        ),
      ),
    );
  }
}
