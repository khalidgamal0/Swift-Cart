import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/responsive_sized_box.dart';

class SideMenuBrands extends StatelessWidget {
  const SideMenuBrands({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ResponsiveSizedBox(
          height: 16,
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 28.w,
              backgroundColor: Colors.white,
              child: Image.asset(
                AssetsData.brand,
                scale: .3.w,
              ),
            ),
            const ResponsiveSizedBox(
              width: 24,
            ),
            CircleAvatar(
              radius: 28.w,
              backgroundColor: Colors.white,
              child: Image.asset(
                AssetsData.brand,
                scale: .3.w,
              ),
            ),
            const ResponsiveSizedBox(
              width: 24,
            ),
            CircleAvatar(
              radius: 28.w,
              backgroundColor: Colors.white,
              child: Image.asset(
                AssetsData.brand,
                scale: .3.w,
              ),
            ),
          ],
        ),
        const ResponsiveSizedBox(
          height: 24,
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 28.w,
              backgroundColor: Colors.white,
              child: Image.asset(
                AssetsData.brand,
                scale: .3.w,
              ),
            ),
            const ResponsiveSizedBox(
              width: 24,
            ),
            CircleAvatar(
              radius: 28.w,
              backgroundColor: Colors.white,
              child: Image.asset(
                AssetsData.brand,
                scale: .3.w,
              ),
            ),
            const ResponsiveSizedBox(
              width: 24,
            ),
            CircleAvatar(
              radius: 28.w,
              backgroundColor: Colors.white,
              child: Image.asset(
                AssetsData.brand,
                scale: .3.w,
              ),
            ),
          ],
        ),
        const ResponsiveSizedBox(
          height: 50,
        ),
      ],
    );
  }
}
