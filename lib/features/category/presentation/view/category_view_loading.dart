import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class CategoryViewLoading extends StatelessWidget {
  const CategoryViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.0.w,
                vertical: 18.h,
              ),
              child: const CustomTextFormField(
                hintText: 'Search',
                suffix: Icons.search_rounded,
                boarderRadius: 40,
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  height: 72.h,
                  margin: EdgeInsets.symmetric(horizontal: 23.w),
                  width: 344.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 24.h,
                );
              },
              itemCount: 8,
            ),
          ],
        ),
      ),
    );
  }
}
