import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'list_view_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left:25.w),
      child: SizedBox(
        height: 114.5.h,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const ListViewItem(),
            separatorBuilder: (context, index) => SizedBox(width: 26.w,),
            itemCount: 10),
      ),
    );
  }
}
