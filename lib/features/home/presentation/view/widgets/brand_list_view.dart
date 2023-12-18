import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/features/home/data/models/categories_model.dart';

import 'brand_listview_item.dart';

class BrandListView extends StatelessWidget {
  const BrandListView({
    super.key,
    required this.categoriesModel,
  });

  final CategoriesModel categoriesModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics:  const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemBuilder: (context, index) => BrandListViewItem(
          image: categoriesModel.data.data[index].image,
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 24.w,
        ),
        itemCount: categoriesModel.data.data.length,
      ),
    );
  }
}
