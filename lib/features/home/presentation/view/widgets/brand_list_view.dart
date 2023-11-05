import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'brand_listview_item.dart';

class BrandListView extends StatelessWidget {
  const BrandListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 26.0.w),
      child: SizedBox(
        height: 100.5.h,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const BrandListViewItem(),
            separatorBuilder: (context, index) => SizedBox(
                  width: 24.w,
                ),
            itemCount: 10),
      ),
    );
  }
}
