import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import 'cat_list_view_item.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const CustomAppbar(text: 'Category'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 18.h),
            child: const CustomTextFormField(
              hintText: 'search',
              suffix: Icons.search_rounded,
              boarderRadius: 40,
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => const CatListViewItem(),
                separatorBuilder: (context, index) => SizedBox(height: 24.h,),
                itemCount: 10),
          )
        ]),
      ),
    );
  }
}
