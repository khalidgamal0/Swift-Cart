import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/features/home/data/models/categories_model.dart';

import 'list_view_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key, required this.categoriesModel,
  });
  final CategoriesModel categoriesModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 114.5.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>  ListViewItem(
          name: categoriesModel.data.data[index].name,
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
