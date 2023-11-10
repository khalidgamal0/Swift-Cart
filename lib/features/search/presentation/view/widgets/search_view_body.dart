import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/constant.dart';
import 'package:swifit_cart/core/utils/styles.dart';
import 'package:swifit_cart/core/widgets/custom_text_form_field.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/search/presentation/view/widgets/search_container.dart';
import 'package:swifit_cart/features/search/presentation/view/widgets/search_grid_view.dart';

import '../../../../product/presentation/view/widgets/grid_view_item.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: (){},
                      child: const Icon(Icons.arrow_circle_left_outlined)),
                  const ResponsiveSizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: CustomTextFormField(
                      hintText: 'Search',
                      suffix: Icons.search,
                      suffixColor: kPrimaryColor.withOpacity(.5),
                      boarderRadius: 40.w,
                      fillColor: kPrimaryColor.withOpacity(.05),
                    ),
                  ),
                ],
              ),
              const ResponsiveSizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  SearchContainer(word: 'Filters'),
                  ResponsiveSizedBox(
                    width: 24,
                  ),
                  SearchContainer(word: 'ALL'),
                ],
              ),
              const ResponsiveSizedBox(
                height: 16,
              ),
              const SearchGridView(),
            ],
          ),
        ),
      ),
    );
  }
}


