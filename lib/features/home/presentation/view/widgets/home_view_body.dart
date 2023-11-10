import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swifit_cart/core/utils/assets.dart';
import 'package:swifit_cart/core/utils/styles.dart';
import 'package:swifit_cart/core/widgets/custom_text_form_field.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import '../../../../../core/constant.dart';
import 'banners.dart';
import 'brand_list_view.dart';
import 'category_list_view.dart';
import 'custom_smooth_indicator.dart';
import 'grid_view_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List x = [
      AssetsData.slider,
      AssetsData.slider,
      AssetsData.slider,
    ];

    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        leading: const Icon(FontAwesomeIcons.listCheck),
        title: Row(children: [
          const Icon(FontAwesomeIcons.store),
          SizedBox(
            width: 16.w,
          ),
          Text(
            'Home',
            style: Styles.textStyle18,
          )
        ]),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Banners(x: x),
            const CustomSmoothPageIndicator(),
            const ResponsiveSizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: const CustomTextFormField(
                hintText: 'search',
                suffix: Icons.search_rounded,
                boarderRadius: 40,
              ),
            ),
            const ResponsiveSizedBox(
              height: 29,
            ),
            const CategoryListView(),
            const ResponsiveSizedBox(
              height: 18.5,
            ),
            const CustomSmoothPageIndicator(),
            const ResponsiveSizedBox(
              height: 37,
            ),
            const BrandListView(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 20.h),
              child: Text(
                'Best Seller',
                style: Styles.textStyle20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 13.w,
                childAspectRatio: 160 / 250,
                children: List.generate(
                  10,
                  (index) => const HomeGridViewItem(),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
