import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/assets.dart';

class BrandListViewItem extends StatelessWidget {
  const BrandListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 56.w,
      backgroundColor: Colors.white,
      child: Image.asset(AssetsData.brand,scale: .4.w,),
    );
  }
}
