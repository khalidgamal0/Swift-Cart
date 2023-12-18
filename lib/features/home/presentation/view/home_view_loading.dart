import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swifit_cart/core/utils/styles.dart';
import 'package:swifit_cart/core/widgets/custom_text_form_field.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/home/presentation/view/widgets/home_grid_view_item_loading.dart';

class HomeViewLoading extends StatelessWidget {
  const HomeViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 8.h),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ResponsiveSizedBox(
              height: 6,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 11.w, vertical: 14.h),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: double.infinity,
                  height: 150.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            const ResponsiveSizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: const CustomTextFormField(
                hintText: 'Search',
                suffix: Icons.search_rounded,
                boarderRadius: 40,
              ),
            ),
            const ResponsiveSizedBox(
              height: 29,
            ),
            SizedBox(
              height: 100.5.h,
              child:ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: 24.w,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 7.h),
                itemCount: 6,
                itemBuilder: (context, index) =>  Container(
                  color: Colors.white,
                  height: 100.5.h,
                  width: 88.w,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 20.h),
              child: Text(
                'Best Seller',
                style: Styles.textStyle20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 13.w,
                  childAspectRatio: 160 / 250,
                ),
                itemBuilder: (context, index) => const HomeGridViewItemLoading(),
                itemCount: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
